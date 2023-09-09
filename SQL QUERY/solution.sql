SELECT * from bands;
SELECT * from albums;

/*Solution*/
CREATE TABLE songs (id INT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, length FLOAT NOT NULL, album_id int NOT NULL, PRIMARY KEY(id), FOREIGN KEY(album_id) REFERENCES albums(id));

SELECT * from songs;

ALTER TABLE bands RENAME COLUMN name TO Band_Name;
DESC bands;

SELECT bands.BAND_NAME AS 'BAND NAMES' from bands;


/*Return Oldest Albums*/
SELECT * from albums WHERE release_year IS NOT NULL ORDER BY release_year LIMIT 1;

/*All bands that have albums*/
SELECT DISTINCT bands.BAND_NAME AS 'BAND NAME' FROM bands JOIN albums ON bands.id = albums.band_id;

/*All bands having no albums*/
SELECT * FROM bands LEFT JOIN albums on bands.id = albums.band_id GROUP BY albums.band_id HAVING COUNT(albums.id) = 0;

/*Get Longest Albums*/
SELECT *  from songs;
SELECT albums.name AS 'Album Name', albums.release_year AS 'Release Year', SUM(songs.length) AS 'Duration' from albums JOIN songs on albums.id = songs.album_id GROUP BY songs.album_id ORDER BY Duration DESC LIMIT 1;

/*Update Null as No release*/
SELECT * from albums where release_year IS NULL;
UPDATE albums SET release_year = 1980 WHERE id = 4; 

/*INSERT*/
INSERT INTO bands(BAND_NAME) VALUES('Fall Out Boys');
INSERT INTO albums(name, release_year, band_id) VALUES('Young Blood', 2019, 8);


/*DELETE With Forign KEY can use ON DELETE Cascade during Forign key*/
SELECT * from bands;
SELECT * from albums;

DELETE FROM albums WHERE band_id = 8;

/*Return Average Length of All Songs*/
SELECT AVG(length) AS 'Average Duration' from songs;


/*Longest Song of each Album*/
SELECT albums.name AS 'Album', albums.release_year AS 'Release Year', MAX(songs.length) AS 'Duration' from albums JOIN songs ON albums.id = songs.album_id GROUP BY songs.album_id;


/*Number of Songs for Each band*/
SELECT * from bands;
SELECT * from albums;
SELECT * from songs; 

SELECT bands.BAND_NAME AS 'Band', COUNT(songs.id) AS 'Number of songs' from bands JOIN albums ON bands.id = albums.band_id JOIN songs ON albums.id = songs.album_id GROUP BY albums.band_id;