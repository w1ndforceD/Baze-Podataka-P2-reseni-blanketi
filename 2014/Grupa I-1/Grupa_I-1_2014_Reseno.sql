-- Kreiranje tabela (ovo sam ja dodao jer tabele na CS-u ne postoje tkd podaci mozda imaju smisla mozda ne, i imaju sufiks _1 jer vec imam tabele sa tim nazivom)

CREATE TABLE KLIJENT_1 (
    ID NUMBER PRIMARY KEY,
    IME VARCHAR2(50),
    PREZIME VARCHAR2(50),
    POL CHAR(1),
    ADRESA VARCHAR2(100),
    DRZAVA VARCHAR2(50)
);

CREATE TABLE VOZILO_1 (
    ID NUMBER PRIMARY KEY,
    PROIZVODJAC VARCHAR2(50),
    VMODEL VARCHAR2(50),
    KILOMETRAZA NUMBER,
    ZAPREMINA_MOTORA NUMBER,
    REGISTRACIJA VARCHAR2(20)
);

CREATE TABLE KLIJENT_VOZILO_1 (
    KLIJENT_ID NUMBER,
    VOZILO_ID NUMBER,
    PRIMARY KEY (KLIJENT_ID, VOZILO_ID),
    FOREIGN KEY (KLIJENT_ID) REFERENCES KLIJENT_1(ID),
    FOREIGN KEY (VOZILO_ID) REFERENCES VOZILO_1(ID)
);

-- Unos podataka u tabelu KLIJENT_1

INSERT INTO KLIJENT_1 VALUES (1, 'Ivan', 'Ivanovic', 'M', 'Bulevar Zorana Djindjica', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (2, 'Marko', 'Markovic', 'M', 'Bulevar Kralja Aleksandra 73', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (3, 'Ana', 'Anic', 'Z', 'Makedonska 12', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (4, 'Petar', 'Petrovic', 'M', 'Knez Mihailova 45', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (5, 'Jelena', 'Jovanovic', 'Z', 'Nemanjina 22', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (6, 'Stefan', 'Stefanovic', 'M', 'Kralja Milana 10', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (7, 'Milica', 'Milic', 'Z', 'Terazije 5', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (8, 'Nikola', 'Nikolic', 'M', 'Resavska 30', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (9, 'Jovana', 'Jovic', 'Z', 'Cara Dusana 15', 'Srbija');
INSERT INTO KLIJENT_1 VALUES (10, 'Aleksandar', 'Aleksic', 'M', 'Vojvode Stepe 100', 'Srbija');

-- Unos podataka u tabelu VOZILO_1

INSERT INTO VOZILO_1 VALUES (1, 'Fiat', 'Punto', 85000, 1200, 'BG-123-AB');
INSERT INTO VOZILO_1 VALUES (2, 'Volkswagen', 'Golf', 120000, 1600, 'BG-456-CD');
INSERT INTO VOZILO_1 VALUES (3, 'Toyota', 'Corolla', 95000, 1400, 'BG-789-EF');
INSERT INTO VOZILO_1 VALUES (4, 'Ford', 'Focus', 110000, 1500, 'BG-321-GH');
INSERT INTO VOZILO_1 VALUES (5, 'Opel', 'Astra', 130000, 1700, 'BG-654-IJ');
INSERT INTO VOZILO_1 VALUES (6, 'Peugeot', '308', 75000, 1600, 'BG-987-KL');
INSERT INTO VOZILO_1 VALUES (7, 'Renault', 'Clio', 60000, 1200, 'BG-147-MN');
INSERT INTO VOZILO_1 VALUES (8, 'Skoda', 'Octavia', 105000, 1800, 'BG-258-OP');
INSERT INTO VOZILO_1 VALUES (9, 'Seat', 'Ibiza', 90000, 1400, 'BG-369-QR');
INSERT INTO VOZILO_1 VALUES (10, 'Mazda', '3', 80000, 1500, 'BG-741-ST');
INSERT INTO VOZILO_1 VALUES (11, 'Honda', 'Civic', 70000, 1600, 'BG-852-UV');
INSERT INTO VOZILO_1 VALUES (12, 'Nissan', 'Micra', 55000, 1000, 'BG-963-WX');
INSERT INTO VOZILO_1 VALUES (13, 'Fiat', 'Punto', 45000, 1200, 'NL-100-YZ');
INSERT INTO VOZILO_1 VALUES (14, 'BMW', '320', 150000, 2000, 'BG-111-AA');
INSERT INTO VOZILO_1 VALUES (15, 'Audi', 'A4', 140000, 2000, 'BG-222-BB');

-- Unos podataka u tabelu KLIJENT_VOZILO_1

INSERT INTO KLIJENT_VOZILO_1 VALUES (1, 13);  
INSERT INTO KLIJENT_VOZILO_1 VALUES (2, 1);  
INSERT INTO KLIJENT_VOZILO_1 VALUES (2, 2);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (3, 3);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (4, 4);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (4, 5);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (5, 6);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (6, 7);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (7, 8);  
INSERT INTO KLIJENT_VOZILO_1 VALUES (8, 1);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (9, 9);   
INSERT INTO KLIJENT_VOZILO_1 VALUES (10, 10); 
INSERT INTO KLIJENT_VOZILO_1 VALUES (3, 11);  
INSERT INTO KLIJENT_VOZILO_1 VALUES (5, 12);  
INSERT INTO KLIJENT_VOZILO_1 VALUES (6, 14);  
INSERT INTO KLIJENT_VOZILO_1 VALUES (7, 15);  
COMMIT;

----------------------------------------------------------------------------------------

--Zadaci od 1 do 3:

/*
1) Napisati SQL upit kojim se kreira pogled IZNAJMLJIVANJE_VOZILA koji sadrži podatke o svim klijentima 
(ID klijenta, ime, prezime i državu) i broju vozila koja su iznajmili.
Korišćenjem kreiranog pogleda odrediti klijenta koji je iznajmio najveći broj vozila. (25 poena)
*/

create view IZNAJMLJIVANJE_VOZILA as
select k.ID, k.ime,k.prezime, k.drzava, count(*) as IznajmljenoVozila
from KLIJENT_1 k, KLIJENT_VOZILO_1 kv
where k.id=kv.klijent_id
group by k.id, k.ime,k.prezime, k.drzava

select id,ime,prezime,drzava,IznajmljenoVozila from iznajmljivanje_vozila 
order by iznajmljenovozila desc 
FETCH FIRST row ONLY

----------------------------------------------------------------------------------------

/*
2) Klijent Ivan Ivanović je promenio prebivalište (adresu i državu). Njegova nova adresa je 3115 Central Mall Drive, država Holandija. 
Napisati SQL upit kojim se ova promena evidentira u bazi podataka. (20 poena)
*/

update KLIJENT_1 set adresa='3115 Central Mall Drive', drzava='Holandija'
where id=(select id from KLIJENT_1 where ime='Ivan' and prezime='Ivanovic');

----------------------------------------------------------------------------------------

/*
3) Napisati SQL upit kojim se iz baze podataka brišu podaci o tome da je bilo koji klijent iz Srbije iznajmljivao bilo koje vozilo proizvođača Fiat marke Punto. (20 poena)
*/

DELETE FROM klijent_vozilo_1 WHERE (klijent_id, vozilo_id) IN ( SELECT k.id, v.id FROM klijent_1 k, vozilo_1 v WHERE k.drzava = 'Srbija' AND v.proizvodjac = 'Fiat' AND v.vmodel = 'Punto');

----------------------------------------------------------------------------------------