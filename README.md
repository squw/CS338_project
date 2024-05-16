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

# Accessing the loaded data:
