# IMDB TV Show Movie System

# Contributors

Henry Sun/ 
 Alan Fang/
 Rain Wang/
 Ruby Fang/
 Lambert Tao

# Data Source

https://datasets.imdbws.com/

# Load Dummy Data into MySQL database method:

1. First we create a database named `imdb_dummy` using the command: `CREATE DATABASE imdb_dummy;`
2. Then we go inside `SQL` folder and find `create_dummy.sql`, run it full and you will get the dummy sample db


# Environment Dependencies:

1. create a `password.env` file in the main folder. Have one line: `MY_PASSWORD="your_actual_db_password"`
2. Python packages (.venv highly recommended):

```
pip install Flask Flask-SQLAlchemy python-dotenv requests pandas SQLAlchemy pymysql cryptography matplotlib pandas
```

# Load Full Data into MySQL database method:

First we create a database named `imdb_data` (or `imdb_data_full` if you already have imdb_data) using the command:
`CREATE DATABASE imdb_data_full;`

1. Run `get_tsv_files.py` to get the tsvs in a tmp folder (do not push this folder and anything inside to repo)
2. Run `enable_local_infile.sql` from your db
3. Run the load table sql queries from your db, change the file path to your own file path OR run the `load_data_from_tsv_full` python script corresponding to your OS.


# Accessing the loaded data:

Run app.py, it will show a sample output for title_akas table in database `imdb_data`

# Features Supported:
1. Search Title: Searches for title, returns relevant media original titles and some detail. 
2. Sort By Rating: Sort all the medias by their rating. 
3. Top Genres: Show top medias by genres. 
4. Clickable titles will lead to more details about that title. 
5. Top Directors Plot
6. Media Region Distribution Pie Chart
7. Sort By Language
8. Most Watched by Region
9. Search by Category
10. Search by Actor and Director
11. Rate Movies/Shows

# About the ./tmp folder

It will be automatically ignored by .gitignore inside the folder, if anything in /tmp shows up in git status, please DO NOT commit as the files inside are likely too big for github.
