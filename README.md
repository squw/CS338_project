# IMDB TV Show Movie System

# Contributors
Henry Sun
Alan Fang
Rain Wang
Ruby Fang
Lambert Tao

# Data Source
https://datasets.imdbws.com/

# Load Data into MySQL database method: 
First we create a database named "imdb_data" using the command:
CREATE DATABASE imdb_data;

Since we have TSV files from IMDB, we choose to use python to load the tables into our MySQL database. 
We use sqlalchemy engine to connect to local mathine
Details in 'Load_Data_From_TSV.py'

1. Run 'get_tsv_files.py' to get the tsvs in a tmp folder (do not push this folder and anything inside to repo)
2. Configure your own password.env as described in 'Load_Data_From_TSV.py'
3. Run 'Load_Data_From_TSV.py' to load all the data into your local database

# Accessing the loaded data:
configure your own test_access_db.ipynb for your local machine to access the database

# About the ./tmp folder
Please do not push ./tmp folder and anything inside as it's a temporary folder to store the tsv files downloaded from the internet