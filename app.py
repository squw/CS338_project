from flask import Flask, render_template, url_for, request, redirect
from flask_sqlalchemy import SQLAlchemy
import os
from urllib.parse import quote
from dotenv import load_dotenv
from sqlalchemy import text
# 'pip install pymysql cryptography' may be a required package for this program to run




# MySQL Creds
load_dotenv(r'./password.env')
host = "localhost"
username = "root"
password = os.getenv('MY_PASSWORD')
database_name = "imdb_data" # change to imdb_data for production data



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{quote(username)}:{quote(password)}@{quote(host)}/{quote(database_name)}?charset=utf8mb4"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


@app.route('/')
def index():
    return render_template("index.html")


# fetching details based on original title
@app.route('/<titleId>', methods=['GET'])
def title_details(titleId):
    sql_path = 'SQL/title_details.sql'
    with open(sql_path, 'r') as file:
        query = text(file.read()).params(titleId=titleId)
    result = db.session.execute(query)
    details_result = result.fetchall()
    return render_template('title_details.html', details_result=details_result)



# Feature1: Sort by language
@app.route('/sort_by_language', methods=['GET', 'POST'])
def sort_by_language():
    sorted_table = None
    if request.method == 'POST':
        language = request.form['language']
        sql_path = 'SQL/Feature1_sort_by_language.sql'
        with open(sql_path, 'r') as file:
            query = text(file.read()).params(selected_language=language)
        result = db.session.execute(query)
        sorted_table = result.fetchall()
    return render_template('sort_by_language.html', sorted_table=sorted_table)

# Feature2: Sort by region
@app.route('/sort_by_region', methods=['GET', 'POST'])
def sort_by_region():
    sorted_table = None
    if request.method == 'POST':
        region = request.form['region']
        sql_path = 'SQL/Feature2_sort_by_region.sql'
        with open(sql_path, 'r') as file:
            query = text(file.read()).params(selected_region=region)
        result = db.session.execute(query)
        sorted_table = result.fetchall()
    return render_template('sort_by_region.html', sorted_table=sorted_table)

# Feature 3: sort by rating
@app.route('/Sort_by_rating')
def sort_by_rating():
    sql_path = 'SQL/Feature3_sort_by_rating.sql'
    with open(sql_path, 'r') as file:
        query = text(file.read())
    result = db.session.execute(query)
    output = result.fetchall()
    return render_template('sort_by_rating.html', sorted_table = output)

# Feature 4: Top 10 in Genres
@app.route('/Top10_In_Genres', methods=['GET', 'POST'])
def Top_Genres():
    output = None
    if request.method == 'POST':
        genre = request.form['genre']
        sql_path = 'SQL/Feature4_Top10_In_Genres.sql'
        with open(sql_path, 'r') as file:
            query = text(file.read()).params(usr_input=f"%{genre}%", threshold_for_votes=500)
        result = db.session.execute(query)
        output = result.fetchall()
    return render_template('top_10_genres.html', sorted_table=output)

# Feature 6, search title
@app.route('/search_title', methods=['GET', 'POST'])
def search_title():
    search_result = None
    message = None
    
    if request.method == 'POST':
        try:
            if 'title' in request.form:  # Handling search request
                title = request.form['title']
                sql_path = 'SQL/Feature6_search_title.sql'
                with open(sql_path, 'r') as file:
                    query = text(file.read()).params(usr_input=f"%{title}%")
                result = db.session.execute(query)
                search_result = result.fetchall()
            elif 'movie_id' in request.form and 'rating' in request.form and 'search_term' in request.form:  # Handling rating submission
                movie_id = request.form['movie_id']
                rating = int(request.form['rating'])
                search_term = request.form['search_term']

                sql_path = 'SQL/Feature8_rate_movie.sql'
                with open(sql_path, 'r') as file:
                    query = text(file.read()).params(movie_id=movie_id, rating=rating)

                try:
                    db.session.execute(query)
                    db.session.commit()
                    message = "Rating submitted successfully!"
                except Exception as e:
                    db.session.rollback()
                    message = f"Error: {e}"

                # Re-execute the search query to refresh the search results
                sql_path = 'SQL/Feature6_search_title.sql'
                with open(sql_path, 'r') as file:
                    query = text(file.read()).params(usr_input=f"%{search_term}%")
                result = db.session.execute(query)
                search_result = result.fetchall()
        except KeyError as e:
            message = f"Missing form field: {e}"
    
    return render_template('search_by_title.html', search_result=search_result, message=message)

# Feature 8: rate movie
@app.route('/rate_movie', methods=['POST'])
def rate_movie():
    movie_id = request.form['movie_id']
    rating = int(request.form['rating'])

    sql_path = 'SQL/Feature8_rate_movie.sql'
    with open(sql_path, 'r') as file:
        query = text(file.read()).params(movie_id=movie_id, rating=rating)

    try:
        db.session.execute(query)
        db.session.commit()
        message = "Rating submitted successfully!"
    except Exception as e:
        db.session.rollback()
        message = f"Error: {e}"

    return redirect(url_for('search_title'))




if __name__ == "__main__":
    app.run(debug=True)