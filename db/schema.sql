
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
TRUNCATE TABLE users;
ALTER SEQUENCE users_id_seq RESTART WITH 1;

-- Create Content table
CREATE TABLE contents(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_timestamp TIMESTAMP,
    edit_timestamp TIMESTAMP,
    title TEXT,
    content TEXT,
    is_image BOOLEAN,
    is_text BOOLEAN
);

-- Reset Content table
TRUNCATE TABLE contents;
ALTER SEQUENCE contents_id_seq RESTART WITH 1;

-- Seed example content
INSERT INTO test_contents(user_id, post_timestamp, edit_timestamp, title, content, is_image, is_text)
VALUES(1, now(), TO_TIMESTAMP(0), 'Yoooooo, Western Australia!', 'https://files.treblesketch.com/2021/03/688c8f2d551cd4ed_2021-03-13.png', true, false);