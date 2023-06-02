# EJERCICIOS SQL

## Sentencias INSERT para llenar cada una de las tablas de la base de datos de zoológicos

Creación de la tabla animales.

``` sql
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
```

Creación de la tabla continentes.

``` sql
INSERT INTO public.continents(
	id, name)
	VALUES 
        (1, 'America'),
        (2, 'Africa'),
        (3, 'Oceania'),
        (4, 'Europa'),
        (5, 'Asia');
```

Creación de la tabla paises.

``` sql
INSERT INTO public.countries(
	id, name, continent_id)
	VALUES 
        (1, 'Colombia', 1),
        (2, 'Kenia', 2),
        (3, 'Egipto', 2),
        (4, 'España', 4);
```

Creación de la tabla paises.

``` sql
INSERT INTO public.countries(
	id, name, continent_id)
	VALUES 
        (1, 'Colombia', 1),
        (2, 'Kenia', 2),
        (3, 'Egipto', 2),
        (4, 'España', 4);
```

Creación de la tabla zoologico.

``` sql
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
```

creación de la tabla zoologicos.

``` sql
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
```

## Realizar las siguientes consultas: 

Consultar los 3 primeros zoológicos de Colombia

``` sql
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
```
Listar los animales que son femeninos o hembras

``` sql
SELECT 
	id,
	commom_name,
	gender
FROM animals
WHERE gender = 'female';
```

Listar todos los animales que están en peligro de extinción.

``` sql
SELECT 
	id,
	commom_name,
	is_in_danger_of_extinction
FROM animals
WHERE is_in_danger_of_extinction = true;
```

Consultar los zoológicos que tienen una área en metros cuadrados entre 100 y 450

``` sql
SELECT 
	id,
	name,
	area
FROM zoos
WHERE area > 100 AND area < 450;
```

Consultar cual es el zoológico con el presupuesto más alto (MÁX)

``` sql
SELECT 
	id,
	name,
	budget
FROM zoos
WHERE budget = (SELECT MAX(budget) FROM zoos);
```

Mostrar cuál es el zoológico con el área más pequeña.

``` sql
SELECT 
	id,
	name,
	area
FROM zoos
WHERE area = (SELECT MIN(area) FROM zoos);
```

Listar los animales en via de extincion del primer zoológico que se encuentra en África (Según los datos que tu insertate)

``` sql
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
```
