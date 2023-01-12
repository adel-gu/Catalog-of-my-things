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
