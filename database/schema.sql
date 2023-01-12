-- genre Table
CREATE TABLE genres (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150),
    PRIMARY KEY (id)
);
