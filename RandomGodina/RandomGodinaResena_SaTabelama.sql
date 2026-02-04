--Tabele nisu dali, ovo sam ja pravio i insert podatke

CREATE TABLE UREDJAJ (
    ID NUMBER PRIMARY KEY,
    TIP VARCHAR2(30),
    MODEL VARCHAR2(50),
    SERIJSKI_BROJ VARCHAR2(50),
    GODINA NUMBER(4)
);

CREATE TABLE RADNIK (
    ID NUMBER PRIMARY KEY,
    IME VARCHAR2(30),
    PREZIME VARCHAR2(30),
    POL CHAR(1),     
    PLATA NUMBER(10,2)
);

CREATE TABLE SERVISIRANJE (
    ID NUMBER PRIMARY KEY,
    UREDJAJ_ID NUMBER NOT NULL,
    RADNIK_ID NUMBER NOT NULL,
    TIP_SERVISA VARCHAR2(20),
    DATUM_POCETKA DATE NOT NULL,
    DATUM_ZAVRSETKA DATE,
    CENA NUMBER(10,2),
    GARANCIJA CHAR(2), 
    CONSTRAINT FK_UREDJAJ FOREIGN KEY (UREDJAJ_ID) REFERENCES UREDJAJ(ID),
    CONSTRAINT FK_RADNIK FOREIGN KEY (RADNIK_ID) REFERENCES RADNIK(ID)
);


INSERT INTO UREDJAJ VALUES (1, 'Televizor', 'Samsung Q60', 'SN1001', 2021);
INSERT INTO UREDJAJ VALUES (2, 'Laptop', 'Dell Inspiron 15', 'SN1002', 2020);
INSERT INTO UREDJAJ VALUES (3, 'Mobilni telefon', 'iPhone 12', 'SN1003', 2022);
INSERT INTO UREDJAJ VALUES (4, 'Ves masina', 'Beko WUE', 'SN1004', 2019);
INSERT INTO UREDJAJ VALUES (5, 'Frizider', 'Gorenje NRK', 'SN1005', 2018);
INSERT INTO UREDJAJ VALUES (6, 'Laptop', 'HP Pavilion', 'SN1006', 2023);
INSERT INTO UREDJAJ VALUES (7, 'Televizor', 'LG OLED', 'SN1007', 2022);



INSERT INTO RADNIK VALUES (1, 'Marko', 'Petrovic', 'M', 75000);
INSERT INTO RADNIK VALUES (2, 'Jelena', 'Jovanovic', 'Z', 82000);
INSERT INTO RADNIK VALUES (3, 'Nikola', 'Ilic', 'M', 68000);
INSERT INTO RADNIK VALUES (4, 'Ana', 'Stankovic', 'Z', 90000);
INSERT INTO RADNIK VALUES (5, 'Milan', 'Kovacevic', 'M', 72000);


INSERT INTO SERVISIRANJE VALUES
(1, 1, 1, 'Popravka',
 DATE '2024-01-10', DATE '2024-01-15', 12000, 'DA');

INSERT INTO SERVISIRANJE VALUES
(2, 2, 2, 'Odrzavanje',
 DATE '2024-02-05', DATE '2024-02-06', 3000, 'NE');

INSERT INTO SERVISIRANJE VALUES
(3, 3, 3, 'Popravka',
 DATE '2024-02-20', NULL, 0, 'DA');

INSERT INTO SERVISIRANJE VALUES
(4, 4, 1, 'Popravka',
 DATE '2024-03-01', DATE '2024-03-10', 15000, 'NE');

INSERT INTO SERVISIRANJE VALUES
(5, 5, 4, 'Odrzavanje',
 DATE '2024-03-15', DATE '2024-03-16', 2500, 'NE');

INSERT INTO SERVISIRANJE VALUES
(6, 6, 2, 'Popravka',
 DATE '2024-04-01', NULL, 0, 'DA');

INSERT INTO SERVISIRANJE VALUES
(7, 1, 5, 'Odrzavanje',
 DATE '2024-04-05', DATE '2024-04-06', 2000, 'DA');

INSERT INTO SERVISIRANJE VALUES
(8, 7, 3, 'Popravka',
 DATE '2024-04-10', DATE '2024-04-20', 18000, 'NE');

INSERT INTO SERVISIRANJE VALUES
(9, 2, 1, 'Popravka',
 DATE '2024-05-01', DATE '2024-05-07', 9000, 'NE');
 
--------------------------------------------------
 
 --Reseni zadaci od 1 do 3
 
 /* 
1) Napisati SQL upit kojim se kreira pogled STATISTIKA koji sadrži podatke o radnicima i to: ime i prezime radnika u jednoj koloni, ukupan broj uređaja koje je servisirao i prosečno vreme trajanja servisa. Korišdenjem kreiranog pogleda prikazati radnika koji je servisirao najviše uređaja. (25 poena) 
*/

create view STATISTIKA as select r.ime||' '||r.prezime, count (s.id) as ServisiraniUredjaji, Round( AVG(Datum_zavrsetka-Datum_pocetka)) as ProsecnoVremeServisiranja from Radnik r, Servisiranje s, Uredjaj u where r.id=s.radnik_id and u.id=s.uredjaj_id group by r.ime,r.prezime 

select * from statistika order by ServisiraniUredjaji DESC fetch first row only

--------------------------------------------------

/*
2) Napisati SQL upit kojim se povecava plata radnicima za 20% ukoliko trenutno na popravci imaju
najmanje 2 različita tipa uređaja i plata im je manja od prosečne. (20 poena)
*/

update Radnik set plata=((plata*120)/100) where id=(select r.id from Radnik r, Servisiranje s, Uredjaj u where r.id=s.radnik_id and u.id=s.uredjaj_id and Datum_zavrsetka is null having count( unique u.tip)>=2 and r.plata<(select AVG(Plata) from radnik) group by r.id, r.plata)

--------------------------------------------------

/*
3)Napisati SQL upit kojim se iz baze podataka brišu sva održavanja koja su trajala manje od 3 dana i za
koje je bio zadužen radnik muškog pola koji je popravljao najmanje 2 uređaja. (20 poena)
*/

DELETE FROM servisiranje
WHERE id IN (
    SELECT s.id
    FROM servisiranje s
    JOIN radnik r ON s.radnik_id = r.id
    WHERE s.tip_servisa = 'Odrzavanje'
      AND r.pol = 'M'
      AND (s.datum_zavrsetka - s.datum_pocetka) < 3
      AND s.radnik_id IN (
          SELECT s2.radnik_id
          FROM servisiranje s2
          WHERE s2.tip_servisa = 'Odrzavanje'
          GROUP BY s2.radnik_id
          HAVING COUNT(s2.id) >= 2
      )
);

--------------------------------------------------
