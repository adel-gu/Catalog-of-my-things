-- Create Author Table
CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(30),
  second_name VARCHAR(30),
  items VARCHAR(100),
  PRIMARY KEY(id),
   FOREIGN KEY(items) REFERENCES(Item)
  )

-- Create Game Table
CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY(id),
  )

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

