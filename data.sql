/* This SQL script populates the 'animals' table with sample data for testing and demonstration purposes. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', 'Feb 3, 2020', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', 'Nov 15, 2018', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', 'Jan 7, 2021', 1, FALSE, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11);



INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', 'Feb 8, 2020', 0, FALSE, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', 'Nov 15, 2021', 2, TRUE, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle', 'Apr 2, 1993', 3, FALSE, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', 'Jul 12, 2005', 1, TRUE, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', 'Jun 7, 2005', 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom', 'Oct 13, 1998', 3, TRUE, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22);

INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

UPDATE animals SET species_id =
CASE WHEN name LIKE '%mon' then (SELECT id FROM species WHERE name = 'Digimon')
ELSE (SELECT id FROM species WHERE name = 'Pokemon') END;

UPDATE animals SET owner_id = CASE
    WHEN name = 'Agumon' then (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name = 'Gabumon' OR name = 'Pikachu' then (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name = 'Devimon' OR name = 'Plantmon' then (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom' then (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name = 'Boarmon' OR name = 'Angemon' then (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;


INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (species_id, vet_id) VALUES
((SELECT id FROM species WHERE name = 'Pokemon'),1),
((SELECT id FROM species WHERE name = 'Digimon'),3),
((SELECT id FROM species WHERE name = 'Pokemon'),3),
((SELECT id FROM species WHERE name = 'Digimon'),4);


INSERT INTO visits (animal_id, vet_id, date) VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets where name = 'William Tatcher'), 'May 24, 2020'),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets where name = 'Stephanie Mendez'), 'Jul 22, 2020'),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets where name = 'Jack Harkness'), 'Feb 2, 2021'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Jan 5, 2020'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Mar 8, 2020'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets where name = 'Maisy Smith'), 'May 14, 2020'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets where name = 'Stephanie Mendez'), 'May 4, 2020'),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets where name = 'Jack Harkness'), 'Feb 24, 2021'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Dec 21, 2019'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets where name = 'William Tatcher'), 'Aug 10, 2020'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Apr 7, 2021'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets where name = 'Stephanie Mendez'), 'Sep 29, 2019'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets where name = 'Jack Harkness'), 'Oct 3, 2020'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets where name = 'Jack Harkness'), 'Nov 4, 2020'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Jan 24, 2019'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets where name = 'Maisy Smith'), 'May 15, 2019'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Feb 27, 2020'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets where name = 'Maisy Smith'), 'Aug 3, 2020'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets where name = 'Stephanie Mendez'), 'May 24, 2020'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets where name = 'William Tatcher'), 'Jan 11, 2021');
