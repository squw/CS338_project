import mysql.connector as mysql
import os
from dotenv import load_dotenv
from flask import Flask, render_template_string


app = Flask(__name__)


def get_samples():
    load_dotenv(r'./password.env')

    db = mysql.connect(
        host = "localhost",
        user = "root",
        password = os.getenv('MY_PASSWORD'),
        database = "imdb_data"
    )

    cursor = db.cursor(dictionary=True)

    sample_query = "SELECT * FROM title_crew LIMIT 5"



    cursor.execute(sample_query)
    title_crew_samples = cursor.fetchall()
    cursor.close
    return title_crew_samples

@app.route('/')
def index():
    title_crew_samples = get_samples()
    html = '''
    <h2>Title Crew</h2>
    <table border="1">
        <tr>
            <th>tconst</th>
            <th>directors</th>
            <th>writers</th>
        </tr>
        {% for sample in title_crew_samples %}
        <tr>
            <td>{{ sample.tconst }}</td>
            <td>{{ sample.directors }}</td>
            <td>{{ sample.writers }}</td>
        </tr>
        {% endfor %}
    </table>
    '''
    return render_template_string(html, title_crew_samples=title_crew_samples)

if __name__ == '__main__':
    app.run(debug=True)