DROP TABLE rentals;
DROP TABLE stock;
DROP TABLE customers;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  tel_number VARCHAR(255)
);

CREATE TABLE stock (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  colour VARCHAR(255),
  price INT4
);

CREATE TABLE rentals (
  id SERIAL PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  stock_id INT4 REFERENCES stock(id)
);
