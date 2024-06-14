import mysql.connector as mysql
import os
from dotenv import load_dotenv
from flask import Flask, render_template, jsonify

app = Flask(__name__)

load_dotenv(r'./password.env')

db = mysql.connect(
    host="localhost",
    user="root",
    password=os.getenv('MY_PASSWORD'),
    database="imdb_dummy"
)

cursor = db.cursor(dictionary=True)

def get_samples():
    cursor = db.cursor(dictionary=True)

    sample_query = "SELECT * FROM title_crew LIMIT 5"
    cursor.execute(sample_query)
    title_crew_samples = cursor.fetchall()
    cursor.close()
    return title_crew_samples

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/data')
def data():
    title_crew_samples = get_samples()
    return jsonify(title_crew_samples)

if __name__ == '__main__':
    app.run(debug=True)