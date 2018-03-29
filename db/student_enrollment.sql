DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id Serial8 PRIMARY KEY,
  house_name VARCHAR(255)
  );

CREATE TABLE students (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  house_id INT8 REFERENCES houses(id) ON DELETE CASCADE
  );
