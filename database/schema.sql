-- Label Table
CREATE TABLE label (
  id SERIAL NOT NULL,
  title VARCHAR(250) NOT NULL, 
  color VARCHAR(250) NOT NULL, 
  PRIMARY KEY (id)
)