-- Kreiranje tabela (ovo sam ja dodao jer tabele na CS-u ne postoje tkd podaci mozda imaju smisla mozda ne)

-- Kreiranje tabele TURISTA
CREATE TABLE TURISTA (
    ID NUMBER PRIMARY KEY,
    IME VARCHAR2(50) NOT NULL,
    PREZIME VARCHAR2(50) NOT NULL,
    POL CHAR(1) CHECK (POL IN ('M', 'Z')),
    ADRESA VARCHAR2(100),
    GRAD VARCHAR2(50),
    DRZAVA VARCHAR2(50)
);

-- Kreiranje tabele HOTEL
CREATE TABLE HOTEL (
    ID NUMBER PRIMARY KEY,
    NAZIV VARCHAR2(100) NOT NULL,
    KAPACITET NUMBER NOT NULL,
    BROJ_ZVEZDICA NUMBER CHECK (BROJ_ZVEZDICA BETWEEN 1 AND 5),
    NA_OBALI NUMBER(1) CHECK (NA_OBALI IN (0, 1)),
    ADRESA VARCHAR2(100),
    GRAD VARCHAR2(50),
    DRZAVA VARCHAR2(50)
);

-- Kreiranje tabele TURISTA_HOTEL
CREATE TABLE TURISTA_HOTEL (
    TURISTA_ID NUMBER,
    HOTEL_ID NUMBER,
    PRIMARY KEY (TURISTA_ID, HOTEL_ID),
    FOREIGN KEY (TURISTA_ID) REFERENCES TURISTA(ID) ON DELETE CASCADE,
    FOREIGN KEY (HOTEL_ID) REFERENCES HOTEL(ID) ON DELETE CASCADE
);

-- Unos podataka u tabelu TURISTA
INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (1, 'Marko', 'Markovic', 'M', 'Kneza Milosa 15', 'Beograd', 'Srbija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (2, 'Ana', 'Petrovic', 'Z', 'Cara Dusana 23', 'Nis', 'Srbija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (3, 'Nikola', 'Jovanovic', 'M', 'Wang Fu Jing 10', 'Peking', 'Kina');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (4, 'Jelena', 'Nikolic', 'Z', 'Trg slobode 8', 'Novi Sad', 'Srbija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (5, 'Stefan', 'Djordjevic', 'M', 'Makedonska 45', 'Skoplje', 'Severna Makedonija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (6, 'Milica', 'Ilic', 'Z', 'Stradun 12', 'Dubrovnik', 'Hrvatska');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (7, 'Aleksandar', 'Stojanovic', 'M', 'Knez Mihailova 7', 'Beograd', 'Srbija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (8, 'Jovana', 'Pavlovic', 'Z', 'Riva 3', 'Split', 'Hrvatska');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (9, 'Lazar', 'Djuric', 'M', 'Boulevard Haussmann 50', 'Pariz', 'Francuska');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (10, 'Teodora', 'Stankovic', 'Z', 'Via Roma 88', 'Rim', 'Italija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (11, 'Milan', 'Kostic', 'M', 'Masarikova 34', 'Zagreb', 'Hrvatska');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (12, 'Sara', 'Todorovic', 'Z', 'Kralja Petra 56', 'Kragujevac', 'Srbija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (13, 'Viktor', 'Zivkovic', 'M', 'Avenida Paulista 1000', 'Sao Paulo', 'Brazil');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (14, 'Katarina', 'Mitrovic', 'Z', 'Nemanjina 19', 'Nis', 'Srbija');

INSERT INTO TURISTA (ID, IME, PREZIME, POL, ADRESA, GRAD, DRZAVA) 
VALUES (15, 'Dusan', 'Vasic', 'M', 'Main Street 45', 'New York', 'SAD');

-- Unos podataka u tabelu HOTEL
INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (1, 'Grand Hotel Adriatic', 250, 5, 1, 'Obala Petra Kresimira 8', 'Dubrovnik', 'Hrvatska');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (2, 'Sunset Resort', 180, 4, 1, 'Beach Boulevard 12', 'Budva', 'Crna Gora');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (3, 'Palace Hotel Belgrade', 150, 5, 0, 'Terazije 23', 'Beograd', 'Srbija');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (4, 'Mountain View', 100, 3, 0, 'Kopaonik bb', 'Kopaonik', 'Srbija');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (5, 'Blue Lagoon', 220, 4, 1, 'Coastal Road 45', 'Hvar', 'Hrvatska');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (6, 'City Center Inn', 80, 3, 0, 'Trg Republike 5', 'Nis', 'Srbija');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (7, 'Royal Beach Hotel', 300, 5, 1, 'Golden Sands 1', 'Varna', 'Bugarska');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (8, 'Alpine Paradise', 120, 4, 0, 'Mountain Pass 78', 'Zakopane', 'Poljska');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (9, 'Seaside Villa', 60, 3, 1, 'Riviera Street 34', 'Tivat', 'Crna Gora');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (10, 'Luxury Plaza', 200, 5, 0, 'Knez Mihailova 50', 'Beograd', 'Srbija');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (11, 'Ocean Breeze', 150, 4, 1, 'Playa del Sol 22', 'Zadar', 'Hrvatska');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (12, 'Green Valley Resort', 90, 3, 0, 'Nature Trail 15', 'Zlatibor', 'Srbija');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (13, 'Diamond Coast', 280, 5, 1, 'Paradise Bay 7', 'Krf', 'Grcka');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (14, 'Urban Oasis', 110, 4, 0, 'City Square 29', 'Podgorica', 'Crna Gora');

INSERT INTO HOTEL (ID, NAZIV, KAPACITET, BROJ_ZVEZDICA, NA_OBALI, ADRESA, GRAD, DRZAVA) 
VALUES (15, 'Mediterranean Pearl', 170, 4, 1, 'Marina Walk 11', 'Kotor', 'Crna Gora');

insert into hotel 
values(16,'Hotel random',100,3,0,'thesaloniki road 14','Neos Marmaras','Grcka');


-- Unos podataka u tabelu TURISTA_HOTEL
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (1, 3);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (1, 7);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (2, 6);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (2, 12);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (3, 13);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (4, 10);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (4, 3);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (5, 1);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (5, 5);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (6, 1);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (7, 10);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (8, 11);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (8, 5);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (9, 2);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (10, 13);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (11, 11);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (11, 1);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (12, 4);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (12, 12);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (13, 7);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (14, 6);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (15, 3);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (15, 10);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (2, 16);
INSERT INTO TURISTA_HOTEL (TURISTA_ID, HOTEL_ID) VALUES (6, 16);

comit;
----------------------------------------------------------------------------------------

--Zadaci od 1 do 3

/*
1) Napisati SQL upit kojim se kreira pogled REZERVACIJE_TURISTA koji sadrži podatke o svim turistima (ID turiste, ime, prezime i državu) i broju hotela u kojima su boravili. Korišćenjem kreiranog pogleda odrediti turistu koji je boravio u najvećem broju hotela. (25 poena)
*/
    
create view REZERVACIJE_TURISTA as    
select t.id, t.ime,t.prezime, t.drzava, th.hotel_id from turista t, turista_hotel th
where t.id=th.turista_id;
     
select id, ime, prezime, count(*) as Broj_Hotela   
from REZERVACIJE_TURISTA  
group by id, ime, prezime 
order by Broj_Hotela DESC  
fetch first row only;

----------------------------------------------------------------------------------------

/*
2) Svim hotelima koji se nalaze u gradu Budva neophodno je promeniti adresu na Budva bb. 
Napisati SQL upit kojim se ova promena evidentira u bazi podataka. (20 poena)
*/

update hotel set adresa='Budva bb' where grad='Budva';

----------------------------------------------------------------------------------------

/*
3) Napisati SQL upit kojim se iz baze podataka brišu podaci o tome da je bilo koji klijent iz Srbije boravio u bilo kom hotelu u gradu Neos Marmaras. (20 poena)
*/
DELETE FROM TURISTA_HOTEL
WHERE TURISTA_ID IN (SELECT ID FROM TURISTA WHERE DRZAVA = 'Srbija')
  AND HOTEL_ID IN (SELECT ID FROM HOTEL WHERE GRAD = 'Neos Marmaras');
  
----------------------------------------------------------------------------------------