CREATE TABLE movie (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER REFERENCES genre(id),
    author_id INTEGER REFERENCES author(id),
    source_id INTEGER REFERENCES source(id),
    label_id INTEGER REFERENCES label(id),
    publish_date DATE,
    archived BOOLEAN
);
CREATE TABLE source (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
-- Create Author Table
CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(30),
  second_name VARCHAR(30),
  PRIMARY KEY(id),
  );

-- Create Game Table
CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  label_id INT,
  genre_id INT,
  source_id INT,
  author_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
);

-- genre Table
CREATE TABLE genres (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150),
    PRIMARY KEY (id)
);

-- Music-Album table
CREATE TABLE music_albums (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    genre_name VARCHAR(150),
    author_id INT,
    author_first_name VARCHAR(150),
    author_last_name VARCHAR(150),
    source_id INT,
    source_name VARCHAR(150),
    label_id INT,
    label_name VARCHAR(150),
    label_color VARCHAR(150),

    PRIMARY KEY (id),
    CONSTRAINT fk_genres
        FOREIGN KEY (genres_id)
            REFERENCES genres(id),
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES  author(id),
    CONSTRAINT fk_source
        FOREIGN KEY (source_id)
            REFERENCES  source(id),
    CONSTRAINT fk_label
        FOREIGN KEY (label_id)
            REFERENCES  label(id)
);

-- Label Table
CREATE TABLE labels (
  id SERIAL NOT NULL,
  title VARCHAR(250) NOT NULL,
  color VARCHAR(250) NOT NULL,
  PRIMARY KEY (id)
)

-- Books Table
CREATE TABLE books (
  id SERIAL NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
)

-- Indexes for movie
CREATE INDEX movie_genre_id ON genres(genre_id);
CREATE INDEX movie_author_id ON authors(author_id);
CREATE INDEX movie_source_id ON source(source_id);
CREATE INDEX movie_label_id ON genres(label_id);
-- Indexes for movie
CREATE INDEX game_genre_id ON genres(genre_id);
CREATE INDEX game_author_id ON authors(author_id);
CREATE INDEX game_source_id ON source(source_id);
CREATE INDEX game_label_id ON genres(label_id);
-- Indexes for movie
CREATE INDEX music_albums_genre_id ON genres(genre_id);
CREATE INDEX music_albums_author_id ON authors(author_id);
CREATE INDEX music_albums_source_id ON source(source_id);
CREATE INDEX music_albums_label_id ON genres(label_id);
-- Indexes for movie
CREATE INDEX book_genre_id ON genres(genre_id);
CREATE INDEX book_author_id ON authors(author_id);
CREATE INDEX book_source_id ON source(source_id);
CREATE INDEX book_label_id ON genres(label_id);