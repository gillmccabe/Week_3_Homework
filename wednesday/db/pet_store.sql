DROP TABLE pets;
DROP TABLE petstore;

CREATE TABLE petstore (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  stock_type VARCHAR(255)
);


CREATE TABLE pets (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255)
  petstore_id INT4 REFERENCES petstore(id)
);