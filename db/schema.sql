
-- Create database
CREATE DATABASE fluffyart_db;

-- Create Users table
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT
);

-- Reset Users table


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


-- Seed example content
INSERT INTO(user_id, post_timestamp, edit_timestamp, title, content, is_image, is_text)
VALUES();