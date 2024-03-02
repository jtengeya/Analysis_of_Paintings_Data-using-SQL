import pandas as pd
from sqlalchemy import create_engine, text
import urllib.parse

host = 'localhost'
username = 'root'
password = urllib.parse.quote_plus('@Baobab..26')

conn_string = f'mysql+pymysql://{username}:{password}@{host}/'

db = create_engine(conn_string)
conn = db.connect()
conn.execute(text("CREATE DATABASE IF NOT EXISTS Paintings"))
conn.close()

database = 'Paintings'
conn_string = f'mysql+pymysql://{username}:{password}@{host}/{database}'
db = create_engine(conn_string)
conn = db.connect()
files = ['artist', 'canvas_size', 'image_link', 'museum', 'museum_hours', 'product_size', 'subject', 'work']
for file in files:
    df = pd.read_csv(f'C:\\Users\\Jackson Tengeya\\SQL\\Data\\{file}.csv')
    df.to_sql(file, con=conn, if_exists='replace', index=False)
conn.close()
