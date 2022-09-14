
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
-- heroku pg:reset --confirm fluffyart && heroku pg:push fluffyart_db DATABASE_URL

-- Seed example content
INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES(1, TO_TIMESTAMP(1647173520), TO_TIMESTAMP(0), 'Yoooooo, Western Australia!', 'https://files.treblesketch.com/2021/03/688c8f2d551cd4ed_2021-03-13.png', 'It sure has been a pretty exciting past few hours, the past few years has been a rollercoaster and tonight is definitely NOT an exception!', true, false);

INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES(1, TO_TIMESTAMP(1659913320), TO_TIMESTAMP(0), 'So excited for today!!!', 'I will be starting my time as a Software Engineer later today, I am so excited that I will be studying lots of things that I have been so excited over for quite some time now. It will be a long 12-weeks, tho I am sure that it will be worth it!!!', '', false, false);

INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES(1, TO_TIMESTAMP(0), TO_TIMESTAMP(0), 'The Start of Unix TIME!!!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat, dicta? Ad quas maxime soluta eos voluptas, tenetur, eum molestias doloribus, ipsam molestiae explicabo excepturi aperiam ullam maiores! Nesciunt, laborum? Aperiam. Lorem ipsum, dolor sit amet consectetur adipisicing elit.
Voluptatum dignissimos pariatur cupiditate error porro accusantium adipisci laudantium sed quos similique nihil reiciendis architecto ipsam autem ab, eligendi dolorem modi consequuntur? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur facilis natus repellat quasi perferendis dolores non, et quis dolorum a suscipit voluptate omnis odit excepturi voluptates quaerat officia explicabo temporibus.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente hic nulla doloribus delectus non? Voluptates quas magni pariatur veritatis deserunt? Alias quisquam tempora eum, ullam dignissimos illum. Consequuntur, dolorum animi! Lorem ipsum dolor sit, amet consectetur adipisicing elit.
Fugit, modi. Totam, ratione cupiditate similique perferendis enim laborum unde eos ut, facilis repudiandae provident sed inventore molestias harum vitae possimus illo.', '', false, false);

INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html)
VALUES(1, now(), TO_TIMESTAMP(0), 'Pretty Spider Nebula here', 'https://www.goodfreephotos.com/albums/astrophotography/spider-nebula-in-space.jpg', 'This view of the Spider Nebula looks absolutely beautiful, I love it! :D', true, false);
