## Import Librairies 
import os
import pandas as pd
from init import ConnectionToDatabase
from sqlalchemy import create_engine

# Raw file link from GitHub
url = "https://raw.githubusercontent.com/Delta483711/DataEng02/main/Netflix_Dataset.csv"

# Load CSV into a DataFrame
df = pd.read_csv(url)

# Show the first few rows
#print(df.head())


##### Connect to Neon or any other database ######

## Declare Connection variables 
username = os.getenv('DB_USERNAME')
password = os.getenv('DB_PASSWORD')
host = os.getenv('DB_HOST')
port = '5432'
database = os.getenv('DB_NAME')
sslmode = 'require'  # Neon requires SSL

## run the connection function 
ConnectionToDatabase(username,password,host,port,database,sslmode)

## Save to database 
connection_string = f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}?sslmode={sslmode}"
engine = create_engine(connection_string)

df.to_sql("NetflixData", engine, schema="raw", if_exists="replace", index=False)

print(" Data written to Neon!")
