CREATE TABLE people(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

INSERT INTO people(last_name, age, first_name)
VALUES ('Belcher', 42, 'Bob');

INSERT INTO people(first_name, last_name, age)
VALUES ('Linda', 'Belcher', 45),
       ('Phillip', 'Frond', 38),
       ('Calvin', 'Fischoeder', 70);