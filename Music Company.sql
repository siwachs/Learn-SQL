CREATE DATABASE music_company;
USE music_company;
CREATE TABLE bands(
	id int AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE albums(
	id int AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_date DATE,
    band_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
); /*YYYY-MM-DD*/


INSERT INTO bands (name) VALUES ('Fall out boys');
INSERT INTO bands (name) VALUES ('Imagine Dragons');
INSERT INTO bands (name) VALUES ('Coldplay');
INSERT INTO bands (name) VALUES ('One rupublic');
INSERT INTO bands (name) VALUES ('Thousand Feet');

INSERT INTO bands (name) VALUES ('Dr Drake'), ('Weekend');

SELECT * from bands;
SELECT * from bands LIMIT 2;
SELECT name from bands;

SELECT id AS 'BAND ID', name AS 'BAND NAME' from bands;
/*Aliasing*/

/*Ordering*/
SELECT * from bands ORDER BY name; 
SELECT * from bands ORDER BY name DESC; 

INSERT INTO albums (name,release_date,band_id) VALUES ('Centures','2010-01-12',1), ('Ligt em up','2020-03-16',1), ('Enemy','2022-01-12',2);

INSERT INTO albums (name,release_date,band_id) VALUES ('TEST',NULL,7) , ('TEST','12-05-16',7);

SELECT * from albums;
SELECT name from albums;
SElECT DISTINCT name from albums;

/*Edit*/
UPDATE albums SET release_date='2023-03-12' WHERE id=6;

/* here percent means any number of char*/ 
SELECT * from albums WHERE name LIKE '%em%';
SELECT * from albums WHERE name LIKE '%XY%' OR band_id=1;
SELECT * from albums WHERE name LIKE '%AB%' AND band_id=1;
SELECT * from albums WHERE id BETWEEN 3 AND 6;
select * from albums WHERE release_date IS NULL;



/*Joins(Inner Join): It join two table on different properties.*/
/*Types -> Inner, LEFT, RIGHT*/

/*Inner Join return value if value on Left is present on Right Table*/
SELECT * from bands JOIN albums ON bands.id = albums.band_id;


/*The LEFT JOIN keyword returns all records from the left table (table1), and the matching records (if any) from the right table (table2). ie it fetch all the band who does not have any album associated.*/
SELECT * from bands LEFT JOIN albums ON bands.id = albums.band_id;


/*The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records (if any) from the left table (table1).*/
SELECT * from bands RIGHT JOIN albums ON bands.id = albums.band_id;


/*Aggregate Functions and group By*/
SELECT AVG(release_date) from albums;
SELECT SUM(release_date) from albums;

SELECT * from albums;
SELECT band_id, COUNT(band_id) from albums GROUP BY band_id;

/*Combine with Join*/
SELECT * from bands;
SELECT * from albums;
SELECT b.name AS band_name, COUNT(a.id) AS num_of_albums from bands AS b LEFT JOIN albums as a ON b.id = a.band_id GROUP BY b.id;


/*Having VS where*/
SELECT b.name AS band_name, COUNT(a.id) AS num_of_albums from bands AS b LEFT JOIN albums as a ON b.id = a.band_id GROUP BY b.id HAVING num_of_albums = 0;

/*Having works after Group statement and where run before grouping*/

DROP DATABASE music_company;

















 



















