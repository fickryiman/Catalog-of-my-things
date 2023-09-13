-- Create the 'items' table to store common properties of all items
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    label VARCHAR(100),
    genre VARCHAR(100),
    author VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN
);

CREATE TABLE games (
    item_id INT PRIMARY KEY REFERENCES items(id),
    label VARCHAR(100),
    genre VARCHAR(100),
    author VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    last_played_at TIMESTAMP
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);


ALTER TABLE items
ADD COLUMN author_id INT,
ADD CONSTRAINT fk_author_id
FOREIGN KEY (author_id)
REFERENCES authors(id);
