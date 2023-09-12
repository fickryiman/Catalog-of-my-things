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
