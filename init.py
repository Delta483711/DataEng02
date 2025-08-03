# Import Librairies 
import psycopg2 as ps

## Connect to data Function 

def ConnectionToDatabase(username,password,host,port,database,sslmode):

## Test connection  
    try:
        connection = ps.connect(
            host=host,
            database=database,
            user=username,
            password=password,
            port=port,
            sslmode=sslmode
        )
        print("Successfully connected to Neon PostgreSQL!")

        connection.close()
    except Exception as e:
        print(" Connection failed:", e)

