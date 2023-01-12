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
