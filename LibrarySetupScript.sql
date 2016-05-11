USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'Library')
DROP DATABASE Library
GO

CREATE DATABASE Library
GO

USE Library
GO

CREATE TABLE Book
(
BookId int PRIMARY KEY,
Title VARCHAR(50) NOT NULL,
PublisherName VARCHAR(50) NOT NULL
)

CREATE TABLE Book_Authors
(
BookId INT NOT NULL,
AuthorName VARCHAR(50) NOT NULL
)

CREATE TABLE Publisher
(
Name VARCHAR(50) PRIMARY KEY,
[Address] VARCHAR(50) NULL,
Phone VARCHAR(15) NULL
)

CREATE TABLE Book_Copies
(
BookId INT NOT NULL,
BranchId INT NOT NULL,
No_Of_Copies INT NOT NULL
)

CREATE TABLE Book_Loans
(
BookId INT NOT NULL,
BranchId INT NOT NULL,
CardNo INT NOT NULL,
DateOut DATE NOT NULL,
DueDate DATE NOT NULL
)

CREATE TABLE Library_Branch
(
BranchId INT PRIMARY KEY,
BranchName VARCHAR(20) NOT NULL,
[Address] VARCHAR(50) NULL
)

CREATE TABLE Borrower
(
CardNo INT PRIMARY KEY,
Name VARCHAR(50) NULL,
[Address] VARCHAR(50) NULL,
Phone VARCHAR(50) NULL
)
GO

INSERT INTO Book
VALUES
(1,'Charlie and the Chocolate Factory','Puffin'),
(2,'Death on the Nile','Collins Crime Club'),
(3,'Even Cowgirls Get the Blues','Houghton Mifflin'),
(4,'The Giving Tree','Harper and Row'),
(5,'Guards! Guards!','Corgi'),
(6,'Interview with the Vampire','Knopf'),
(7,'It','Viking'),
(8,'Jitterbug Perfume','Bantam USA'),
(9,'The Left Hand of Darkness','Ace Books'),
(10,'The Lost Tribe','Picador USA'),
(11,'Matilda','Harcourt Brace Jovanovich'),
(12,'The Mediterranean Caper','Pyramid'),
(13,'Murder on the Orient Express','Collins Crime Club'),
(14,'The Shining','Doubleday'),
(15,'The Sorcerer''s Stone','Scholastic'),
(16,'The Tale of the Body Thief','Knopf'),
(17,'Treasure','Simon and Schuster'),
(18,'The Wee Free Men','Doubleday'),
(19,'Where the Sidewalk Ends','Harper Collins'),
(20,'A Wizard of Earthsea','Parnassus Press')

INSERT INTO Book_Authors
VALUES
(1,'Roald Dahl'),
(2,'Agatha Christie'),
(3,'Tom Robbins'),
(4,'Shel Silverstein'),
(5,'Terry Pratchett'),
(6,'Anne Rice'),
(7,'Stephen King'),
(8,'Tom Robbins'),
(9,'Ursula K. Le Guin'),
(10,'Mark Lee'),
(11,'Roald Dahl'),
(12,'Clive Cussler'),
(13,'Agatha Christie'),
(14,'Stephen King'),
(15,'J.K. Rowling'),
(16,'Anne Rice'),
(17,'Clive Cussler'),
(18,'Terry Pratchett'),
(19,'Shel Silverstein'),
(20,'Ursula K. Le Guin')

INSERT INTO Publisher
VALUES
('Ace Books',NULL,NULL),
('Bantam USA',NULL,NULL),
('Collins Crime Club',NULL,NULL),
('Corgi',NULL,NULL),
('Doubleday',NULL,NULL),
('Harcourt Brace Jovanovich',NULL,NULL),
('Harper and Row',NULL,NULL),
('Harper Collins',NULL,NULL),
('Houghton Mifflin',NULL,NULL),
('Knopf',NULL,NULL),
('Parnassus Press',NULL,NULL),
('Picador USA',NULL,NULL),
('Puffin',NULL,NULL),
('Pyramid',NULL,NULL),
('Scholastic',NULL,NULL),
('Simon and Schuster',NULL,NULL),
('Viking',NULL,NULL)

INSERT INTO Library_Branch
VALUES
(1,'Sharpstown', '1111 Pointy Ave.'),
(2,'Central', '5 Broadway'),
(3,'Underwater', '8698 Lake Bottom Way'),
(4,'Floating', '1762 Cloud St.')

INSERT INTO Borrower
VALUES
(1,'Danny Torrance','The Overlook Hotel','Phone Broken, Use Radio'),
(2,'Tiffany Aching','The Cottage on the Chalk','Feegle Message'),
(3,'Hercule Poirot','Brussels','+32 2 555 87 25'),
(4,'Ged Sparrowhawk','Gont','Summoning Spell'),
(5,'The Boy','The House','(555)555-5555'),
(6,'Dirk Pitt','Washington, D.C.','(202)555-9688'),
(7,'Albus Dumbledore','Headmaster''s Office, Hogwarts','Owl Post'),
(8,'David Mather','The Desert','Unlikely'),
(9,'V''lu Jackson','Perfumerie Devalier, New Orleans','(504)555-8374'),
(10,'Louis de Pointe du Lac','Pointe du Lac, New Orleans','Bat Post'),
(11, 'Willy Wonka','The Chocolate Factory','Oompa-Loompa Post')


INSERT INTO Book_Copies
VALUES
(1,1,2),
(2,1,0),
(3,1,0),
(4,1,4),
(5,1,3),
(6,1,3),
(7,1,4),
(8,1,3),
(9,1,0),
(10,1,0),
(11,1,0),
(12,1,0),
(13,1,2),
(14,1,0),
(15,1,3),
(16,1,0),
(17,1,4),
(18,1,0),
(19,1,0),
(20,1,2),
(1,2,0),
(2,2,3),
(3,2,4),
(4,2,0),
(5,2,0),
(6,2,0),
(7,2,0),
(8,2,0),
(9,2,2),
(10,2,3),
(11,2,2),
(12,2,4),
(13,2,0),
(14,2,4),
(15,2,0),
(16,2,3),
(17,2,0),
(18,2,2),
(19,2,3),
(20,2,0),
(1,3,3),
(2,3,0),
(3,3,0),
(4,3,0),
(5,3,4),
(6,3,0),
(7,3,3),
(8,3,0),
(9,3,0),
(10,3,0),
(11,3,2),
(12,3,3),
(13,3,4),
(14,3,3),
(15,3,3),
(16,3,0),
(17,3,4),
(18,3,2),
(19,3,0),
(20,3,0),
(1,4,0),
(2,4,3),
(3,4,4),
(4,4,3),
(5,4,0),
(6,4,3),
(7,4,0),
(8,4,3),
(9,4,2),
(10,4,4),
(11,4,0),
(12,4,0),
(13,4,0),
(14,4,0),
(15,4,0),
(16,4,3),
(17,4,0),
(18,4,0),
(19,4,2),
(20,4,2)

INSERT INTO Book_Loans
VALUES
(1,1,1,'2016-03-23','2016-04-13'),
(4,1,1,'2016-03-23','2016-04-13'),
(15,1,1,'2016-03-23','2016-04-13'),
(17,1,1,'2016-03-23','2016-04-13'),
(20,1,1,'2016-03-23','2016-04-13'),
(2,4,2,'2016-04-06','2016-04-27'),
(3,4,2,'2016-04-06','2016-04-27'),
(6,4,2,'2016-04-06','2016-04-27'),
(9,4,2,'2016-04-06','2016-04-27'),
(10,4,2,'2016-04-06','2016-04-27'),
(16,4,2,'2016-04-06','2016-04-27'),
(19,4,2,'2016-04-06','2016-04-27'),
(20,4,2,'2016-04-06','2016-04-27'),
(10,2,3,'2016-03-28','2016-04-18'),
(12,2,3,'2016-03-28','2016-04-18'),
(14,2,3,'2016-03-28','2016-04-18'),
(16,2,3,'2016-03-28','2016-04-18'),
(5,3,4,'2016-03-24','2016-04-14'),
(7,3,4,'2016-03-24','2016-04-14'),
(11,3,4,'2016-03-24','2016-04-14'),
(12,3,4,'2016-03-24','2016-04-14'),
(14,3,4,'2016-03-24','2016-04-14'),
(15,3,4,'2016-03-24','2016-04-14'),
(17,3,4,'2016-03-24','2016-04-14'),
(9,2,5,'2016-03-21','2016-04-11'),
(14,2,5,'2016-03-21','2016-04-11'),
(6,1,6,'2016-03-30','2016-04-20'),
(7,1,6,'2016-03-30','2016-04-20'),
(8,1,6,'2016-03-30','2016-04-20'),
(13,1,6,'2016-03-30','2016-04-20'),
(2,4,7,'2016-04-12','2016-05-03'),
(3,4,7,'2016-04-12','2016-05-03'),
(4,4,7,'2016-04-12','2016-05-03'),
(6,4,7,'2016-04-12','2016-05-03'),
(8,4,7,'2016-04-12','2016-05-03'),
(10,4,7,'2016-04-12','2016-05-03'),
(19,4,7,'2016-04-12','2016-05-03'),
(20,4,7,'2016-04-12','2016-05-03'),
(5,1,8,'2016-04-03','2016-04-24'),
(7,1,8,'2016-04-03','2016-04-24'),
(15,1,8,'2016-04-03','2016-04-24'),
(17,1,8,'2016-04-03','2016-04-24'),
(2,2,9,'2016-04-10','2016-05-01'),
(12,2,9,'2016-04-10','2016-05-01'),
(14,2,9,'2016-04-10','2016-05-01'),
(11,3,10,'2016-04-9','2016-04-30'),
(13,3,10,'2016-04-9','2016-04-30'),
(15,3,10,'2016-04-9','2016-04-30'),
(17,3,10,'2016-04-9','2016-04-30'),
(18,3,10,'2016-04-9','2016-04-30')