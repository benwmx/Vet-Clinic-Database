/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name AS name_of_animal FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name AS name_of_animal FROM animals WHERE neutred = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name AS name_of_animal, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutred = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.5 AND 17.3;

-- Transactions--

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT after_deletion;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO after_deletion;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

--  End of transactions

SELECT COUNT(*) AS number_of_animals FROM animals;
SELECT COUNT(*) AS never_tried_to_escape FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS avg_weight FROM animals;
SELECT neutred, ROUND(AVG(escape_attempts)) avg_escape_attempts FROM animals GROUP BY neutred ORDER BY avg_escape_attempts DESC;
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts)) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

SELECT full_name owner_name, name animal_name 
FROM owners o JOIN animals a ON a.owner_id = o.id
WHERE full_name = 'Melody Pond';

SELECT s.name species_name, a.name animal_name
FROM species s JOIN animals a ON s.id = a.species_id
WHERE s.name = 'Pokemon';

SELECT o.full_name owner_name, a.name animal_name
FROM owners o LEFT JOIN animals a ON o.id = a.owner_id;

SELECT s.name species, COUNT(a.id) number_of_animals
FROM species s JOIN animals a ON s.id = a.species_id
GROUP BY s.name;

SELECT o.full_name owner_name, a.name digimons_name
FROM owners o JOIN (
  species s JOIN animals a ON s.id = a.species_id
) ON o.id = a.owner_id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT o.full_name owner_name, a.name animals_not_tried_to_escape
FROM owners o JOIN (
  species s JOIN animals a ON s.id = a.species_id
) ON o.id = a.owner_id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name owner_name, COUNT(a.id) number_of_animals
FROM owners o JOIN (
  species s JOIN animals a ON s.id = a.species_id
) ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY number_of_animals DESC;

-- Complex questions

SELECT vet.name vet_name, a.name animal_name, v.date_of_visit date_of_visit
FROM vets vet JOIN (
  animals a JOIN visits v ON a.id = v.animal_id
) ON vet.id = v.vet_id
WHERE vet.name = 'William Tatcher'
ORDER BY v.date_of_visit DESC;

SELECT vet.name vet_name, a.name animal_name
FROM vets vet JOIN (
  animals a JOIN visits v ON a.id = v.animal_id
) ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez';

SELECT vet.name vet_name, s.name
FROM vets vet LEFT JOIN (
  species s JOIN specializations sp ON s.id = sp.species_id
) ON vet.id = sp.vet_id;

SELECT vet.name vet_name, a.name animal_name, v.date_of_visit
FROM vets vet JOIN (
  animals a JOIN visits v ON a.id = v.animal_id
) ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez' AND  v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name animal_name, COUNT(v.id) number_of_visits
FROM animals a JOIN visits v ON a.id = v.animal_id
GROUP BY a.name
ORDER BY number_of_visits DESC;

SELECT vet.name vet_name, a.name animal_name, v.date_of_visit
FROM vets vet JOIN (
  animals a JOIN visits v ON a.id = v.animal_id
) ON vet.id = v.vet_id
WHERE vet.name = 'Maisy Smith'
ORDER BY v.date_of_visit ASC;

SELECT a.name animal_name, a.date_of_birth, a.escape_attempts, a.neutred, a.weight_kg, s.name species_name, vet.name vet_name, vet.age vet_age, vet.date_of_graduation, v.date_of_visit
FROM (visits v JOIN vets vet ON v.vet_id = vet.id)
JOIN (animals a JOIN species s ON a.species_id = s.id)
ON v.animal_id = a.id
ORDER BY v.date_of_visit DESC;

SELECT COUNT(*) visits_without_specialized_vets
FROM (animals a JOIN visits v ON a.id = v.animal_id)
JOIN (vets vet JOIN specializations s ON vet.id = s.vet_id)
ON vet.id = v.vet_id
WHERE s.species_id != a.species_id;

SELECT vet.name vet_name, s.name species_name
FROM (vets vet JOIN visits v ON vet.id = v.vet_id)
JOIN (species s JOIN animals a ON s.id = a.species_id)
ON a.id = v.animal_id
WHERE vet.name = 'Maisy Smith';