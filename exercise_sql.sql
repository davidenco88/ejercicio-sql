-- ---------------------------------------------------------------------------
-- Consultar los 3 primeros zoológicos de Colombia
-- ---------------------------------------------------------------------------

INSERT INTO public.animals(
	id,commom_name, scientific_name, is_in_danger_of_extinction, gender)
	VALUES
        (1,'Lobo', 'Lupus Canis', false, 'male'),
        (2,'Tiburon Blanco', 'Carchadoron Carcharias', true, 'female'),
        (3,'Oso Polar', 'Ursus maritimus', true, 'male'),
        (4,'Lobo gris mexicano', 'Canis lupus baileyi', false, 'female'),
        (5,'Jaguar', 'Pantera onca', false, 'male'),
        (6,'Tigre de bengala', 'Panthera tigris tigris', true, 'male'),
        (7,'Guacamayo verde', 'Ara militaris', false, 'female'),
        (8,'Armadillo gigante', 'Priodontes maximus', false, 'male'),
        (9,'Leon blanco', 'Panthera leo krugeri', true, 'female'),
        (10,'Cocodrilo americano', 'Crocodylus acutus', true, 'male');

INSERT INTO public.continents(
	id, name)
	VALUES 
        (1, 'America'),
        (2, 'Africa'),
        (3, 'Oceania'),
        (4, 'Europa'),
        (5, 'Asia');

INSERT INTO public.countries(
	id, name, continent_id)
	VALUES 
        (1, 'Colombia', 1),
        (2, 'Kenia', 2),
        (3, 'Egipto', 2),
        (4, 'España', 4);


INSERT INTO public.cities(
	id, name, country_id)
	VALUES 
        (1, 'Medellin', 1),
        (2, 'Cali', 1),
        (3, 'Bogota', 1),
        (4, 'Barranquilla', 1),
        (5, 'Nairobi', 2),
        (6, 'El Cairo', 3),
        (7, 'Madrid', 4);

INSERT INTO public.zoos(
	id, name, area, budget, city_id)
	VALUES 
	    (1, 'Zoo1', 512, 900, 1),
		(2, 'Zoo2', 735, 1350, 2),
		(3, 'Zoo3', 287, 520, 3),
		(4, 'Zoo4', 611, 1120, 4),
		(5, 'Zoo5', 444, 760, 5),
		(6, 'Zoo6', 921, 1400, 6),
		(7, 'Zoo7', 378, 630, 7);

INSERT INTO public.animals_by_zoo(
	id, zoo_id, animal_id)
	VALUES 
        (1, 1, 1), (2, 1, 2), (3, 1, 3), (4, 1, 4),
        (5, 1, 5), (6, 1, 6), (7, 1, 7), (8, 1, 8),
        (9, 1, 9), (10, 1, 10), (11, 2, 1), (12, 2, 2),
        (13, 2, 3), (14, 2, 4), (15, 2, 5), (16, 2, 6),
        (17, 2, 7), (18, 2, 8), (19, 2, 9), (20, 2, 10),
        (21, 3, 1), (22, 3, 2), (23, 3, 3), (24, 3, 4),
        (25, 3, 5), (26, 3, 6), (27, 3, 7), (28, 3, 8),
        (29, 3, 9), (30, 3, 10), (31, 4, 1), (32, 4, 2),
        (33, 4, 3), (34, 4, 4), (35, 4, 5), (36, 4, 6),
        (37, 4, 7), (38, 4, 8), (39, 4, 9), (40, 4, 10),
        (41, 5, 1), (42, 5, 2), (43, 5, 3), (44, 5, 4),
        (45, 5, 5), (46, 5, 6), (47, 5, 7), (48, 5, 8),
        (49, 5, 9), (50, 5, 10), (51, 6, 1), (52, 6, 2),
        (53, 6, 3), (54, 6, 4), (55, 6, 5), (56, 6, 6),
        (57, 6, 7), (58, 6, 8), (59, 6, 9), (60, 6, 10),
        (61, 7, 1), (62, 7, 2), (63, 7, 3), (64, 7, 4),
        (65, 7, 5), (66, 7, 6), (67, 7, 7), (68, 7, 8),
        (69, 7, 9), (70, 7, 10), (71, 1, 1), (72, 1, 2),
        (73, 1, 3), (74, 1, 4), (75, 1, 5), (76, 1, 6),
        (77, 1, 7), (78, 1, 8), (79, 1, 9), (80, 1, 10),
        (81, 2, 1), (82, 2, 2), (83, 2, 3), (84, 2, 4),
        (85, 2, 5), (86, 2, 6), (87, 2, 7), (88, 2, 8),
        (89, 2, 9), (90, 2, 10), (91, 3, 1), (92, 3, 2),
        (93, 3, 3), (94, 3, 4), (95, 3, 5), (96, 3, 6),
        (97, 3, 7), (98, 3, 8), (99, 3, 9), (100, 3, 10);
-- ---------------------------------------------------------------------------
-- Consultar los 3 primeros zoológicos de Colombia
-- ---------------------------------------------------------------------------
SELECT 
	zoos.id, 
	zoos.name, 
	zoos.city_id,
	cities.name AS city_name,
	countries.id AS country_id,
	countries.name AS country_name
FROM zoos
INNER JOIN cities ON zoos.city_id = cities.id
INNER JOIN countries ON countries.id = cities.country_id
WHERE countries.id = 1
ORDER BY zoos.id
LIMIT 3;

-- ---------------------------------------------------------------------------
-- Listar los animales que son femeninos o hembras
-- ---------------------------------------------------------------------------
SELECT 
	id,
	commom_name,
	gender
FROM animals
WHERE gender = 'female';

-- ---------------------------------------------------------------------------
-- Listar todos los animales que están en peligro de extinción.
-- ---------------------------------------------------------------------------
SELECT 
	id,
	commom_name,
	is_in_danger_of_extinction
FROM animals
WHERE is_in_danger_of_extinction = true;

-- ---------------------------------------------------------------------------
-- Consultar los zoológicos que tienen una área en metros cuadrados entre 100 y 450
-- ---------------------------------------------------------------------------
SELECT 
	id,
	name,
	area
FROM zoos
WHERE area > 100 AND area < 450;


-- ---------------------------------------------------------------------------
-- Consultar cual es el zoológico con el presupuesto más alto (MÁX)
-- ---------------------------------------------------------------------------
SELECT 
	id,
	name,
	budget
FROM zoos
WHERE budget = (SELECT MAX(budget) FROM zoos);

-- ---------------------------------------------------------------------------
-- Mostrar cuál es el zoológico con el área más pequeña.
-- ---------------------------------------------------------------------------
SELECT 
	id,
	name,
	area
FROM zoos
WHERE area = (SELECT MIN(area) FROM zoos);

-- ---------------------------------------------------------------------------
-- Listar los animales en via de extincion del primer zoológico que se encuentra en África (Según los datos que tu insertate)
-- ---------------------------------------------------------------------------
SELECT 
	zoos.id AS zoo_id, 
	zoos.name AS zoo_name,
	cities.name AS city_name,
	countries.name AS country_name,
	continents.name AS continent_name,
	animals.commom_name AS animal_name
FROM zoos
INNER JOIN animals_by_zoo ON zoos.id = animals_by_zoo.zoo_id
INNER JOIN animals ON animals.id = animals_by_zoo.animal_id
INNER JOIN cities ON zoos.city_id = cities.id
INNER JOIN countries ON countries.id = cities.country_id
INNER JOIN continents ON continents.id = countries.continent_id
WHERE continents.id = 2 AND animals.is_in_danger_of_extinction
ORDER BY zoos.id;