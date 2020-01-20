CREATE DATABASE SNCF_db
CREATE TABLE Ville
(
    codepost INT NOT NULL,
    nomville VARCHAR(100),
    PRIMARY KEY (`codepost`)
)
CREATE TABLE Gare
(
    idgare INT NOT NULL,
    nomgare VARCHAR(100),
    codepost INT,
    PRIMARY KEY (`idgare`),
    FOREIGN KEY (`codepost`) REFERENCES Ville(`codepost`)
)
CREATE TABLE TGV
(
    idtrain INT NOT NULL,
    idgaredepart INT,
    idgarearrivee INT,
    heuredepart VARCHAR(100),
    heurearrivee DATETIME,
    PRIMARY KEY (`idtrain`),
    FOREIGN KEY (`idgaredepart`) REFERENCES Gare(`idgare`),
    FOREIGN KEY (`idgarearrivee`) REFERENCES Gare(`idgare`)
)
