-- Table: public.books
-- DROP TABLE IF EXISTS public.books;
CREATE TABLE IF NOT EXISTS public.books
(
    id integer NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    publisher text COLLATE pg_catalog."default",
    cover_state text COLLATE pg_catalog."default",
    publish_date date,
    label_id integer,
    archived boolean,
    CONSTRAINT books_pkey PRIMARY KEY (id),
    CONSTRAINT label_id FOREIGN KEY (label_id)
        REFERENCES public.labels (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.books
    OWNER to postgres;


-- Table: public.labels
-- DROP TABLE IF EXISTS public.labels;
CREATE TABLE IF NOT EXISTS public.labels
(
    id integer NOT NULL DEFAULT nextval('labels_id_seq'::regclass),
    title text COLLATE pg_catalog."default",
    color text COLLATE pg_catalog."default",
    CONSTRAINT labels_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.labels
    OWNER to postgres;


/* Database schema to keep the structure of the MusicAlbum database*/

CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY,
    label VARCHAR(100),
    genre VARCHAR(100),
    author VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    on_spotify BOOLEAN,
    weight_kg FLOAT,
    PRIMARY KEY(id)
);


CREATE TABLE genre_music (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

-- Create a foreign key to associate GenreMusic with MusicAlbums
ALTER TABLE music_album
ADD COLUMN genre_music_id INT,
ADD CONSTRAINT fk_genre_music_id
FOREIGN KEY (genre_music_id)
REFERENCES public.genre_music(id);


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