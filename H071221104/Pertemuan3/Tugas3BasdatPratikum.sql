--1

CREATE DATABASE praktikum3;

USE praktikum3;
CREATE TABLE mahasiswa(
NIM VARCHAR (10) NOT NULL PRIMARY KEY,
Nama VARCHAR (50) NOT NULL,
Kelas CHAR (1) NOT NULL,
`Status`VARCHAR (50) NOT NULL,
Nilai INT 
);

DESCRIBE mahasiswa




INSERT INTO mahasiswa (NIM, Nama, Kelas, `Status`, Nilai) 
VALUES ('H071241056', 'Kolitna', 'A', 'Hadir', 100);

INSERT INTO mahasiswa
VALUES ('H071241060', 'Pitonia', 'A', 'Alfa', 85),
		 ('H071241063', 'Jovano', 'A', 'Hadir', 50),
		 ('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
	    ('H071241066', 'Pihap E', 'B', 'Hadir', 85),
	    ('H071241079', 'Ruby', 'B', 'Alfa', 90);

--2 
UPDATE mahasiswa
SET Nilai = 0, Kelas ='C'
WHERE `Status` = 'Alfa';


--3
DELETE FROM mahasiswa
WHERE Nilai > 90;

--4
INSERT INTO mahasiswa
VALUES ('H07122104','Jamal','C','Pindahan', NULL );

UPDATE mahasiswa
SET nilai = 50
WHERE `Status` ='Alfa';

UPDATE mahasiswa 
SET Kelas ='A';

SELECT * FROM mahasiswa





UPDATE mahasiswa
SET Kelas = 'S', `Status` = 'lulus'
WHERE `Status` = 'Hadir' AND Nilai > 50;
		 




