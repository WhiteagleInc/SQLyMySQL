INSERT INTO authors(name, nationality) 
VALUES('Juan Rulfo', 'MEX');

INSERT INTO authors(name, nationality) 
VALUES('Gabriel Garcia Marquez', 'COL');

INSERT INTO authors(name, nationality) 
VALUES('Juan Gabriel Vasquez','COL');

INSERT INTO authors(name, nationality)
VALUES('Julio Cortazar','ARG'),
('Isabel Allende', 'CHI'),
('Octavio Paz', 'MEX');

INSERT INTO authors(name, nationality) 
VALUES('Juan Carlos Onetti','URU');

INSERT INTO clients (name, email, birthdate, gender, active) VALUES 
('Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',1),

INSERT INTO clients (name, email, birthdate, gender, active) VALUES 
('Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1);

INSERT INTO clients (name, email, birthdate, gender, active) VALUES 
('Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1);

INSERT INTO clients (name, email, birthdate, gender, active) VALUES 
('Maria Luisa Marin','Maria Luisa.83726282A@random.names','1957-07-30','F',1);

INSERT INTO clients (name, email, birthdate, gender, active) VALUES 
('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
ON DUPLICATE KEY UPDATE active = VALUES(active);

INSERT INTO books (title, author_id) 
VALUES ('El laberinto de la soledad', 1);

INSERT INTO books (title, author_id, `year`) 
VALUES ('Vuelta al laberinto de la soledad',
(SELECT author_id FROM authors WHERE name = 'Octavio Paz' LIMIT 1),
1960
);

UPDATE books 
SET author_id = 6 
WHERE book_id = 1;



