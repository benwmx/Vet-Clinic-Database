/* Populate database with sample data. */

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutred,
  weight_kg
)
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutred,
  weight_kg
)
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutred,
  weight_kg
)
VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);


INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutred,
  weight_kg
)
VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);

-- Additional Data --
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutred,
  weight_kg
)
VALUES
('Charmander', '2020-01-08', 0, FALSE, -11),
('Plantmon', '2022-11-15', 2, TRUE, -5.7),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45),
('Boarmon', '2005-06-07', 7, TRUE, 20.4),
('Blossom', '1998-10-13', 3, TRUE, 17);

-- Owners

INSERT INTO owners (
  full_name,
  age
) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Winchester', 38);

-- Species

INSERT INTO species (
  name
)
VALUES 
('Pokemon'),
('Digimon');

-- Modifications of animals table
UPDATE animals SET
species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals SET
species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';

UPDATE animals SET 
owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Jennifer Orwell'
)
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Bob'
)
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Melody Pond'
)
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Dean Winchester'
)
WHERE name IN ('Angemon', 'Boarmon');

--  Vets 

INSERT INTO vets (
  name,
  age,
  date_of_graduation
)
VALUES ('William Tatcher', 45, 'April 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

--Specializiation

INSERT INTO specializations (
  vet_id,
  species_id
)
VALUES (
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM species WHERE name = 'Pokemon')
),
(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM species WHERE name = 'Digimon')
),
(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM species WHERE name = 'Pokemon')
),
(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM species WHERE name = 'Digimon')
);

-- Visits
INSERT INTO visits (
  animal_id,
  vet_id,
  date_of_visit
)
VALUES (
  (SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  'May 24, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  'Jul 22, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Gabumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  'Feb 02, 2021'
),
(
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Jan 05, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Mar 08, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'May 14, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Devimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  'May 04, 2021'
),
(
  (SELECT id FROM animals WHERE name = 'Charmander'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  'Feb 24, 2021'
),
(
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Dec 21, 2019'
),
(
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  'Aug 10, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Apr 07, 2021'
),
(
  (SELECT id FROM animals WHERE name = 'Squirtle'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  'Sep 29, 2019'
),
(
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  'Oct 03, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  'Nov 04, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Jan 24, 2019'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'May 15, 2019'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Feb 27, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  'Aug 03, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  'May 24, 2020'
),
(
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  'Jan 11, 2021'
);
