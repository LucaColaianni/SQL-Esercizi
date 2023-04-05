use Azienda;
create database Azienda

CREATE TABLE Impiegati (
  ID_impiegato BIGINT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50),
  Cognome VARCHAR(50),
  Eta INT,
  Email VARCHAR(50),
  Cellulare VARCHAR(20) CHECK (LENGTH(Cellulare)>=10),
  Ruolo VARCHAR(200)
);

INSERT INTO Impiegati (Nome, Cognome, Eta, Email, Cellulare, Ruolo) 
VALUES 
  ('Mario', 'Rossi', 30, 'mario.rossi@azienda.com', '3331234567', 'Programmatore'), 
  ('Luca', 'Bianchi', 28, 'luca.bianchi@azienda.com', '3339876543', 'Designer'),
  ('Giulia', 'Verdi', 25, 'giulia.verdi@azienda.com', '3332467810', 'Project Manager');

-- Progetti ha una relazione one-to-many con la tabella task, un progetto può avere 
-- molte task, ma ogni task appartiene ad un solo progetto.
CREATE TABLE Progetti (
  ID_progetto BIGINT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50),
  Descrizione VARCHAR(500),
  Data_inizio VARCHAR(10),
  ID_impiegato_responsabile BIGINT,
  FOREIGN KEY (ID_impiegato_responsabile) REFERENCES Impiegati(ID_impiegato)
);
SELECT * FROM progetti
INSERT INTO Progetti (Nome, Descrizione, Data_inizio, ID_impiegato_responsabile)
VALUES 
  ('Progetto X', 'Descrizione del progetto X', '26/07/2022', 1),
  ('Progetto Y', 'Descrizione del progetto Y', '07/08/2021', 3),
  ('Progetto Z', 'Descrizione del progetto Z', '10/10/2020', 2);

CREATE TABLE Task (
  ID_task BIGINT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50),
  Descrizione VARCHAR(500),
  Tecnologia VARCHAR(100),
  ID_progetto BIGINT,
  FOREIGN KEY (ID_progetto) REFERENCES Progetti(ID_progetto)
);

INSERT INTO Task (Nome, Descrizione, Tecnologia, ID_progetto)
VALUES 
  ('Task 1', 'Descrizione del task 1', 'Java', 1),
  ('Task 2', 'Descrizione del task 2', 'Spreing', 1),
  ('Task 3', 'Descrizione del task 3', 'HTML/CSS', 2),
  ('Task 4', 'Descrizione del task 4', 'JavaScript', 2),
  ('Task 5', 'Descrizione del task 5', 'C#', 3);
-- Many-to-many, un impiegato può avere molti progetti 
-- e un progetto può essere associato a molti impiegati.
CREATE TABLE Impiegato_Progetto (
  ID_impiegato BIGINT,
  ID_progetto BIGINT,
  FOREIGN KEY (ID_impiegato) REFERENCES Impiegati(ID_impiegato),
  FOREIGN KEY (ID_progetto) REFERENCES Progetti(ID_progetto)
);
SELECT * FROM impiegato_progetto
INSERT INTO Impiegato_Progetto (ID_impiegato, ID_progetto)
VALUES 
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 2),
  (3, 3);
  
  -- Voglio tutti gli impiegati che sono sul progetto id 1 
SELECT * 
FROM Impiegati
LEFT JOIN  impiegato_progetto
ON Impiegati.ID_impiegato  = Impiegato_Progetto.ID_impiegato
WHERE Impiegato_Progetto.ID_impiegato =1;


  
  
  