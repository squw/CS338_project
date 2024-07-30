from flask import Flask, render_template, url_for, request, redirect, send_file
from flask_sqlalchemy import SQLAlchemy
import os
from urllib.parse import quote
from dotenv import load_dotenv
from sqlalchemy import text
from io import BytesIO
import base64

import matplotlib
matplotlib.use('Agg')  # Use a non-GUI backend

import matplotlib.pyplot as plt
import pandas as pd
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



procedure_created = False

def create_procedure():
    global procedure_created
    if not procedure_created:
        db.session.execute(text("USE " + database_name + ";"))
        db.session.execute(text("DROP PROCEDURE IF EXISTS UpdateMovieRating;"))
        db.session.execute(text("""
        CREATE PROCEDURE UpdateMovieRating(IN movieId VARCHAR(255), IN userRating INT)
        BEGIN
            DECLARE currentAvg FLOAT;
            DECLARE currentVotes INT;

            SELECT averageRating, numVotes
            INTO currentAvg, currentVotes
            FROM title_ratings
            WHERE tconst = movieId;

            -- Calculate the new average rating
            SET currentAvg = ((currentAvg * currentVotes) + userRating) / (currentVotes + 1);
            SET currentVotes = currentVotes + 1;

            -- Update the title_ratings table
            UPDATE title_ratings
            SET averageRating = currentAvg, numVotes = currentVotes
            WHERE tconst = movieId;
        END
        """))
        db.session.commit()
        procedure_created = True
        
def load_category_queries():
    queries = {}
    with open('SQL/Feature5_search_by_category.sql', 'r') as file:
        lines = file.readlines()
        category = None
        query = []
        for line in lines:
            line = line.strip()
            if line.startswith('--'):
                if category and query:
                    queries[category] = ' '.join(query)
                    query = []
                category = line.replace('--', '').strip()
            elif line:
                query.append(line)
        if category and query:
            queries[category] = ' '.join(query)
    return queries

with app.app_context():
    create_procedure()
    category_queries = load_category_queries()

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

# Feature2: most watched by region

@app.route('/most_watched_by_region', methods=['GET', 'POST'])
def most_watched_by_region():
    regions = ['US', 'GB', 'IN', 'CA', 'AU', 'FR', 'DE', 'JP', 'CN', 'KR']
    most_watched = None
    selected_region = None
    if request.method == 'POST':
        selected_region = request.form['region']
        sql_path = 'SQL/Feature2_most_watching_by_region.sql'
        with open(sql_path, 'r') as file:
            query = file.read()
        result = db.session.execute(text(query), {'region': selected_region})
        most_watched = result.fetchall()
    return render_template('most_watched_by_region.html', 
                           regions=regions, 
                           most_watched=most_watched, 
                           selected_region=selected_region,
                           enumerate=enumerate)

# Feature 3: sort by rating
@app.route('/sort_by_rating')
def sort_by_rating():
    sql_path = 'SQL/Feature3_sort_by_rating.sql'
    with open(sql_path, 'r') as file:
        query = text(file.read())
    result = db.session.execute(query)
    output = result.fetchall()
    return render_template('sort_by_rating.html', sorted_table = output)

# Feature 4: Top 10 in Genres
@app.route('/top_genres', methods=['GET', 'POST'])
def top_genres():
    output = None
    if request.method == 'POST':
        genre = request.form['genre']
        threshold_for_votes = request.form.get('threshold_for_votes', 50000, type=int)
        sql_path = 'SQL/Feature4_Top10_In_Genres.sql'
        with open(sql_path, 'r') as file:
            query = text(file.read()).params(usr_input=f"%{genre}%", threshold_for_votes=threshold_for_votes)
        result = db.session.execute(query)
        output = result.fetchall()
    return render_template('top_10_genres.html', sorted_table=output)

# Feature 5: search by category
@app.route('/search_by_category', methods=['GET', 'POST'])
def search_by_category():
    selected_category = None
    results = []
    if request.method == 'POST':
        selected_category = request.form['category']
        query = category_queries.get(selected_category)
        if query:
            results = db.session.execute(text(query)).fetchall()
            
    return render_template('search_by_category.html', 
                           results = results, selected_category = selected_category)

# Feature 6, search title combine with feature 8, rate movie
@app.route('/search_title', methods=['GET', 'POST'])
def search_title():
    search_result = None
    message = None
    
    if request.method == 'POST':
        try:
            if 'title' in request.form:  # Handling search request
                title = request.form['title']
                #title = f'%{request.form['title']}%'
                sql_path = 'SQL/Feature6_search_title.sql'
                with open(sql_path, 'r') as file:
                    query = text(file.read()).params(usr_input=f'{title}')
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


@app.route('/top_directors', methods=['GET', 'POST'])
def top_directors():
    try:
        sql_path = 'SQL/top_directors.sql'
        min_votes = request.form.get('min_votes', 50000, type=int)
        num_directors = request.form.get('num_directors', 30, type=int)
        
        with open(sql_path, 'r') as file:
            query = text(file.read()).params(min_votes=min_votes, num_directors=num_directors)
        
        result = db.session.execute(query)
        directors = result.fetchall()

        if not directors:
            return render_template('top_directors.html', message="No directors found with the given criteria.")
        
        df = pd.DataFrame(directors, columns=['director_name', 'avg_rating'])
        
        if df.empty:
            return render_template('top_directors.html', message="No data to display.")
        
        num_directors = len(df)
        plt.figure(figsize=(12, max(6, num_directors / 2)))
        plt.barh(df['director_name'], df['avg_rating'], color='skyblue')
        plt.xlabel('Average Rating')
        plt.ylabel('Director')
        plt.title('Top Directors by Average Movie Rating')
        plt.gca().invert_yaxis()
        
        img = BytesIO()
        plt.savefig(img, format='png')
        plt.close()
        img.seek(0)
        
        plot_url = base64.b64encode(img.getvalue()).decode('utf8')
        
        return render_template('top_directors.html', plot_url=plot_url, min_votes=min_votes, num_directors=num_directors)
    except Exception as e:
        return render_template('error.html', message=f"An error occurred: {e}")



@app.route('/region_pie_chart', methods=['GET', 'POST'])
def region_pie_chart():
    sql_path = 'SQL/count_regions.sql'
    num_regions = request.form.get('num_regions', 10, type=int)
    with open(sql_path, 'r') as file:
        query = text(file.read()).params(num_regions = num_regions)
    result = db.session.execute(query)
    regions = result.fetchall()
    
    df = pd.DataFrame(regions, columns=['region', 'count'])
    plt.figure(figsize=(8, 8))
    plt.pie(df['count'], labels=df['region'], autopct='%1.1f%%', startangle=140)
    plt.title('Media Distribution by Region')
    
    img = BytesIO()
    plt.savefig(img, format='png')
    plt.close()
    img.seek(0)
    
    plot_url = base64.b64encode(img.getvalue()).decode('utf8')
    return render_template('region_pie_chart.html', plot_url=plot_url, num_regions = num_regions)
    
# feature 9
@app.route('/search_by_actor_and_director', methods=['GET', 'POST'])
def search_by_actor_and_director():
    results = []
    if request.method == 'POST':
        actor_name = request.form['actor_name']
        director_name = request.form['director_name']
        sql_path = 'SQL/Feature9_Actor_Director_Collaboration_Tracker.sql'
        with open(sql_path, 'r') as file:
            query = file.read()
        result = db.session.execute(text(query), {'actor': actor_name, 'director': director_name})
        results = result.fetchall()
        
    print(results)
        
    return render_template('search_by_actor_and_director.html', results=results)

if __name__ == "__main__":
    app.run(debug=True)