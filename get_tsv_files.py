import requests
import os
import shutil
import gzip

def download_and_unzip(url, tmp_dir, file_name):
    # Create the temporary directory if it doesn't exist
    os.makedirs(tmp_dir, exist_ok=True)
    
    # Define the paths
    gz_file_path = os.path.join(tmp_dir, file_name)
    tsv_file_name = file_name.replace('.gz', '')
    tsv_file_path = os.path.join(tmp_dir, tsv_file_name)
    
    # Download the .gz file
    response = requests.get(url, stream=True)
    with open(gz_file_path, 'wb') as gz_file:
        shutil.copyfileobj(response.raw, gz_file)
    
    # Unzip the .gz file to extract the .tsv file
    with gzip.open(gz_file_path, 'rb') as gz_file:
        with open(tsv_file_path, 'wb') as tsv_file:
            shutil.copyfileobj(gz_file, tsv_file)
    
    # Optionally, you can remove the .gz file after extraction
    os.remove(gz_file_path)
    
    return tsv_file_path

# Usage
url_list = ["https://datasets.imdbws.com/name.basics.tsv.gz", 
            "https://datasets.imdbws.com/title.akas.tsv.gz", 
            "https://datasets.imdbws.com/title.basics.tsv.gz", 
            "https://datasets.imdbws.com/title.crew.tsv.gz",
            "https://datasets.imdbws.com/title.episode.tsv.gz",
            "https://datasets.imdbws.com/title.principals.tsv.gz",
            "https://datasets.imdbws.com/title.ratings.tsv.gz"]
tmp_dir = "./tmp"
file_name_list = ["name.basics.tsv.gz", "title.akas.tsv.gz", "title.basics.tsv.gz", "title.crew.tsv.gz",
                  "title.episode.tsv.gz", "title.principals.tsv.gz", "title.ratings.tsv.gz"]

for i in range(len(file_name_list)): 
    tsv_file_path = download_and_unzip(url_list[i], tmp_dir, file_name_list[i])
    print(f"TSV file extracted and saved to {tsv_file_path}")
