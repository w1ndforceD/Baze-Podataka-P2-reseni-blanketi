--Ovo nisu originalne tabele koje su oni dali, ovo sam ja napravio ( mozda nije 100% tacno obratiti paznju)

CREATE TABLE ZAPOSLENI (
    JMBG CHAR(13) PRIMARY KEY,
    IME VARCHAR2(30) NOT NULL,
    PREZIME VARCHAR2(30) NOT NULL,
    ULICA VARCHAR2(50),
    BROJ VARCHAR2(10),
    MESTO VARCHAR2(30),
    PLATA NUMBER(8,2) CHECK (PLATA >= 60000)
);

CREATE TABLE KOMPANIJA (
    IDK NUMBER PRIMARY KEY,
    IMEK VARCHAR2(50) NOT NULL,
    GODINA_OSN NUMBER(4),
    PIB CHAR(9) UNIQUE,
    ADRESA VARCHAR2(100)
);

CREATE TABLE RADNO_MESTO (
    IDK NUMBER,
    ZJMBG CHAR(13),
    POZICIJA VARCHAR2(50),
    DATUMOD DATE,
    DATUMDO DATE,
    CONSTRAINT PK_RADNO_MESTO PRIMARY KEY (IDK, ZJMBG, DATUMOD),
    CONSTRAINT FK_RM_KOMPANIJA FOREIGN KEY (IDK)
        REFERENCES KOMPANIJA(IDK),
    CONSTRAINT FK_RM_ZAPOSLENI FOREIGN KEY (ZJMBG)
        REFERENCES ZAPOSLENI(JMBG)
);

INSERT INTO ZAPOSLENI VALUES
('0101990712345','Marko','Marković','Nemanjina','12','Beograd',75000);

INSERT INTO ZAPOSLENI VALUES
('0202990712346','Jelena','Jovanović','Cara Dušana','45','Novi Sad',82000);

INSERT INTO ZAPOSLENI VALUES
('0303990712347','Nikola','Petrović','Bulevar oslobođenja','78','Niš',60000);

INSERT INTO ZAPOSLENI VALUES
('0404990712348','Ana','Ilić','Kralja Petra','3','Kragujevac',90000);

INSERT INTO ZAPOSLENI VALUES
('0505990712349','Stefan','Stanković','Zmaj Jovina','22','Subotica',68000);

INSERT INTO ZAPOSLENI VALUES
('0606990712350','Milan','Đorđević','Vojvode Stepe','101','Beograd',72000);

INSERT INTO ZAPOSLENI VALUES
('0707990712351','Ivana','Nikolić','Laze Telečkog','9','Novi Sad',88000);

INSERT INTO ZAPOSLENI VALUES
('0808990712352','Petar','Pavlović','Dušanova','15','Niš',65000);

INSERT INTO ZAPOSLENI VALUES
('0909990712353','Marija','Kovačević','Cara Lazara','44','Čačak',70000);

INSERT INTO ZAPOSLENI VALUES
('1010990712354','Aleksandar','Ristić','Bulevar Evrope','56','Novi Sad',95000);




INSERT INTO KOMPANIJA VALUES
(1,'Knjaz Miloš',1811,'100200300','Aranđelovac bb');

INSERT INTO KOMPANIJA VALUES
(2,'Coca-Cola HBC Srbija',1997,'200300400','Zemun, Batajnički drum');

INSERT INTO KOMPANIJA VALUES
(3,'Next',2000,'300400500','Bačka Palanka');

INSERT INTO KOMPANIJA VALUES
(4,'Rauch Srbija',2004,'400500600','Koceljeva');

INSERT INTO KOMPANIJA VALUES
(5,'Red Bull Srbija',2005,'500600700','Beograd, Airport City');

INSERT INTO KOMPANIJA VALUES
(6,'PepsiCo Srbija',2003,'600700800','Surčin');

INSERT INTO KOMPANIJA VALUES
(7,'Voda Vrnjci',1978,'700800900','Vrnjačka Banja');


INSERT INTO RADNO_MESTO VALUES
(1,'0101990712345','Tehnolog',
 DATE '2018-03-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(2,'0202990712346','Menadžer prodaje',
 DATE '2019-06-15', NULL);

INSERT INTO RADNO_MESTO VALUES
(3,'0303990712347','Radnik u proizvodnji',
 DATE '2020-01-10', DATE '2022-12-31');

INSERT INTO RADNO_MESTO VALUES
(1,'0303990712347','Supervizor',
 DATE '2023-01-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(4,'0404990712348','Finansijski analitičar',
 DATE '2017-09-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(3,'0505990712349','Vođa smene',
 DATE '2021-05-20', NULL);

INSERT INTO RADNO_MESTO VALUES
(2,'0606990712350','Komercijalista',
 DATE '2020-04-01', DATE '2022-06-30');

INSERT INTO RADNO_MESTO VALUES
(5,'0606990712350','Regionalni menadžer',
 DATE '2022-07-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(6,'0707990712351','Marketing specijalista',
 DATE '2019-02-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(7,'0808990712352','Kontrolor kvaliteta',
 DATE '2018-11-15', DATE '2021-03-31');

INSERT INTO RADNO_MESTO VALUES
(1,'0808990712352','Tehnolog',
 DATE '2021-04-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(3,'0909990712353','Administrativni radnik',
 DATE '2020-09-01', NULL);

INSERT INTO RADNO_MESTO VALUES
(4,'1010990712354','Direktor finansija',
 DATE '2016-01-01', NULL);

---------------------------------------------------------------

--Reseni zadaci od 1 do 3

/* 
1) Napisati SQL upit kojim se kreira pogled STATISTIKA koji sadrži podatke o radnicima i to: ime i prezime radnika u jednoj koloni, ukupan broj uređaja koje je servisirao i prosečno vreme trajanja servisa. Korišdenjem kreiranog pogleda prikazati radnika koji je servisirao najviše uređaja. (25 poena) 
*/

create view STATISTIKA as select r.ime||' '||r.prezime, count (s.id) as ServisiraniUredjaji, Round( AVG(Datum_zavrsetka-Datum_pocetka)) as ProsecnoVremeServisiranja from Radnik r, Servisiranje s, Uredjaj u where r.id=s.radnik_id and u.id=s.uredjaj_id group by r.ime,r.prezime 

select * from statistika order by ServisiraniUredjaji DESC fetch first row only

---------------------------------------------------------------

/*
2) Svim zaposlenima koji su trenutno angažovani a koji su pre trenutnog zaposlenja radili na bar još 
jednom radnom mestu u kompaniji iz Niša potrebno je povećati platu za 15%. Napisati SQL upit 
kojim se ova promena evidentira u bazi podataka. (20 poena) 
*/

UPDATE zaposleni z
SET z.plata = z.plata * 1.15
WHERE z.jmbg IN (SELECT rm1.zjmbg FROM radno_mesto rm1, radno_mesto rm2, kompanija k WHERE rm1.zjmbg = rm2.zjmbg AND rm1.datumdo IS NULL  AND rm2.datumdo IS NOT NULL AND rm2.idk = k.idk AND k.adresa LIKE '%Niš%');

---------------------------------------------------------------

/*
3) Napisati SQL upit kojim se iz baze podataka brišu podaci o trenutnom zaposlenju svih zaposlenih 
koji rade u kompaniji koja je osnovana pre 2000. godine i čiji je prethodni radni staž izražen u 
danima duži od 1000 dana. (20 poena) 
*/

DELETE FROM radno_mesto rm_tren
WHERE rm_tren.datumdo IS NULL
  AND rm_tren.idk IN ( SELECT k.idk FROM kompanija k WHERE k.godina_osn < 2000)
  AND rm_tren.zjmbg IN ( SELECT rm_pre.zjmbg FROM radno_mesto rm_pre WHERE rm_pre.datumdo IS NOT NULL GROUP BY rm_pre.zjmbg HAVING SUM(rm_pre.datumdo - rm_pre.datumod) > 1000);
