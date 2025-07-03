#!/usr/bin/python3
"""
Script to create the 'alx_book_store' database in MySQL.
Handles existing database gracefully and provides proper feedback.
"""

import MySQLdb
from sys import argv

def create_database():
    """
    Creates the 'alx_book_store' database if it doesn't exist.
    Handles connection errors and provides appropriate messages.
    """
    try:
        # Connect to MySQL server (without specifying a database)
        connection = MySQLdb.connect(
            host="localhost",
            user=argv[1],
            passwd=argv[2],
            port=3306
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Create database (IF NOT EXISTS prevents failure if DB already exists)
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        
        # Print success message
        print("Database 'alx_book_store' created successfully!")
        
    except MySQLdb.Error as e:
        # Handle connection/creation errors
        print(f"Error connecting to MySQL or creating database: {e}")
        
    finally:
        # Close the connection if it was established
        if 'connection' in locals() and connection.open:
            cursor.close()
            connection.close()
            print("MySQL connection closed")

if __name__ == "__main__":
    # Check for correct number of arguments (username, password)
    if len(argv) != 3:
        print("Usage: python3 MySQLServer.py <mysql_username> <mysql_password>")
    else:
        create_database()