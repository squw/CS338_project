import pandas as pd
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from urllib.parse import quote
from sqlalchemy.sql import text

# Create a password.env to store password: file has one line: MY_PASSWORD = "your_password"
# This line loads the env file created
load_dotenv(r'./password.env')

# MySQL Creds
host = "localhost"
username = "root"
password = os.getenv('MY_PASSWORD')
database_name = "imdb_data" # create a imdb_data_full database and switch this to "imdb_data_full" if you have imdb_data pre-loaded from before

# Create connection to MySQL
engine = create_engine(f"mysql+pymysql://{quote(username)}:{quote(password)}@{quote(host)}/{quote(database_name)}?charset=utf8mb4", connect_args={"local_infile": 1})


# Tables to add
table_names = ["name_basics", "title_akas", "title_basics", "title_crew", "title_episode", "title_principals", "title_ratings"]
# Paths for the tsv files
raw_file_paths = [r"./tmp/name.basics.tsv", 
                  r"./tmp/title.akas.tsv", 
                  r"./tmp/title.basics.tsv", 
                  r"./tmp/title.crew.tsv", 
                  r"./tmp/title.episode.tsv", 
                  r"./tmp/title.principals.tsv", 
                  r"./tmp/title.ratings.tsv"]

# Paths for the sql files
sql_paths = ['load_name_basics.sql',
             'load_title_akas.sql',
             'load_title_basics.sql',
             'load_title_crew.sql',
             'load_title_episode.sql',
             'load_title_principals.sql',
             'load_title_ratings.sql']

for i in range(len(sql_paths)): 
    # Load the sql query into python
    with open(sql_paths[i], 'r') as file:
        sql_load = file.read()

    # Switch the "file_path" var in 
    place_holder = 'file_path'
    full_file_path = os.path.abspath(raw_file_paths[i])
    modified_sql_load = sql_load.replace(place_holder, full_file_path)


    try:
        # Connect to MySQL
        with engine.connect() as conn:
            # Split the suqries inside the .sql file and run all of them one by one
            for statement in modified_sql_load.split(';'):
                if statement.strip():
                    conn.execute(text(statement))
            
            # Apply all the changes
            conn.commit()
    except Exception as e:
        print("Error:", e)