CREATE DATABASE IMDb
USE IMDb

CREATE TABLE Movies
(
Id int PRIMARY KEY IDENTITY,
[Name] nvarchar(50) UNIQUE,
Point decimal(18,1),
Duration nvarchar(20),
DirectorId int FOREIGN KEY REFERENCES Directors(Id),
ActorId int FOREIGN KEY REFERENCES Actors(Id),
GenreId int FOREIGN KEY REFERENCES Genres(Id)
)
INSERT INTO Movies ([Name], Point, GenreId, DirectorId, ActorId) VALUES
('The Dark Knight', 6, 2, 2, 3),
('Schindler"s List', 5.2, 5, 1, 5),
('Godzilla x Kong:TNY', 9.6, 6, 3, 1),
('Interstellar', 8.7, 4, 2, 4),
('Karayip Korsan', 8.9, 3, 4, 2)


CREATE TABLE Directors
(
Id int PRIMARY KEY IDENTITY,
[Name] nvarchar(50)
)
INSERT INTO Directors ([Name]) VALUES
('Steven Spielberg'),
('Christopher Nolan'),
('Adam Wingard'),
('Espen Sandberg')


CREATE TABLE Actors
(
Id int PRIMARY KEY IDENTITY,
[Name] nvarchar(50)
)
INSERT INTO Actors ([Name]) VALUES
('Kaylee Hottle'), --Jia
('Johnny Depp'), --Cek Sparrow
('Christian Bale'), -- Batman
('Matthew McConaughey'),--Cooper
('Liam Neeson') -- Oscar schindler


CREATE TABLE Genres
(
Id int PRIMARY KEY IDENTITY,
[Name] nvarchar(50)
)
INSERT INTO Genres ([Name]) VALUES
('Horror'),
('Drama'),
('Adventure'),
('Science fiction'),
('Action'),
('Superhero')

 


---Müəllim bu bütün filmlərin lazımi məlumatlarını göstərir. Özüm üçün yazdım daha rahat görə bilim deyə.
SELECT 'Movies' AS Table_Name, Name FROM Movies
UNION ALL
SELECT 'Genres' AS Table_Name, Name FROM Genres
UNION ALL
SELECT 'Actors' AS Table_Name, Name FROM Actors
UNION ALL
SELECT 'Directors' AS Table_Name, Name FROM Directors

-------FIRST------
SELECT m.Name MovieName, m.Point IMDbdeyer, g.Name GenreName, a.Name ActorName, d.Name DirectorName
FROM Movies m
JOIN Genres g ON m.GenreId = g.Id
JOIN Actors a ON m.ActorId = a.Id
JOIN Directors d ON m.DirectorId = d.Id
WHERE m.Point > 6

---------SECOND--------
SELECT m.Name MovieName, m.Point IMDbdeyer, g.Name FROM Movies m
JOIN Genres g ON m.GenreId=g.Id
WHERE g.Name LIKE '%a%'

---------THIRD---------
SELECT m.Name MovieName, m.Point IMDbdeyer, m.Duration MovieTime, g.Name GenreName FROM Movies m
JOIN Genres g ON m.GenreId=g.Id
WHERE LEN(m.Name) > 10 AND m.Name LIKE '%t' 

--------FOURTH-------
SELECT m.Name MovieName, m.Point IMDbdeyer, g.Name GenreName, a.Name ActorName, d.Name DirectorName
FROM Movies m
JOIN Genres g ON m.GenreId = g.Id
JOIN Actors a ON m.ActorId = a.Id
JOIN Directors d ON m.DirectorId = d.Id
WHERE m.Point> (SELECT AVG(Point) TotalIMDb FROM Movies)
ORDER BY m.Point DESC

































