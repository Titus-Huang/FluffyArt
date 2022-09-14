
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
    content_description TEXT,
    is_image BOOLEAN,
    is_html BOOLEAN
);

-- Reset Content table
TRUNCATE TABLE contents;
ALTER SEQUENCE contents_id_seq RESTART WITH 1;

-- now()

-- Create Test Content table
CREATE TABLE test_contents(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_timestamp TIMESTAMP,
    edit_timestamp TIMESTAMP,
    title TEXT,
    content TEXT,
    content_description TEXT,
    is_image BOOLEAN,
    is_html BOOLEAN
);


-- heroku pg:reset --confirm fluffyart
-- heroku pg:push fluffyart_db DATABASE_URL


-- Seed example content
INSERT INTO test_contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES(1, TO_TIMESTAMP(1647173520), TO_TIMESTAMP(0), 'Yoooooo, Western Australia!', 'https://files.treblesketch.com/2021/03/688c8f2d551cd4ed_2021-03-13.png', 'It sure has been a pretty exciting past few hours, the past few years has been a rollercoaster and tonight is definitely NOT an exception!', true, false);

INSERT INTO test_contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES();

INSERT INTO test_contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES();