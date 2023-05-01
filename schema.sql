/* This is the database schema for the vet_clinic database which defines the structure of the entire database, including the 'animals' table. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id INT,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL (3,2),
  PRIMARY KEY (id);
);