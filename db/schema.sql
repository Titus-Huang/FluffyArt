
-- Create database
CREATE DATABASE fluffyart_db;

-- Create Users table
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT
);

-- Create Content table
CREATE TABLE content(
    id SERIAL PRIMARY KEY,
    user_id TEXT,
    post_timestamp TIMESTAMP,
    edit_timestamp TIMESTAMP,
    title TEXT,
    content TEXT,
    is_image BOOLEAN,
    is_text BOOLEAN
);
