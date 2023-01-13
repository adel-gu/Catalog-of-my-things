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
   FOREIGN KEY(author_id) REFERENCES authors(id),
   FOREIGN KEY(genre_id) REFERENCES genres(id),
   FOREIGN KEY(source_id) REFERENCES sources(id),
   FOREIGN KEY(label_id) REFERENCES labels(id)
);

