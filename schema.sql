/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutred BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);