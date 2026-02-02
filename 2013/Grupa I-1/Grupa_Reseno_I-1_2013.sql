--TABELE I UNOS:
CREATE TABLE ZAPOSLENI
(
	MBR NUMBER(5,0),
	IME VARCHAR(30) NOT NULL,
	IME_RODITELJA VARCHAR(30),
	PREZIME VARCHAR(30) NOT NULL,
	ADRESA VARCHAR(150),
	ODELJENJE VARCHAR(20),
	CONSTRAINT ZAPOSLENI_PK PRIMARY KEY(MBR),
	CONSTRAINT ODELJENJE_CK CHECK(ODELJENJE IN ('Administracija', 'Proizvodnja', 'Prodaja'))
);
CREATE TABLE DOKUMENT
(
	ID_DOKUMENTA NUMBER,
	NAZIV VARCHAR(50) NOT NULL,
	DATUM_KREIRANJA DATE NOT NULL,
	MBR_VLASNIKA NUMBER(5,0) NOT NULL ,
	TIP VARCHAR(40) NOT NULL,
	CONSTRAINT DOKUMENT_PK PRIMARY KEY(ID_DOKUMENTA),
	CONSTRAINT ZAPOSLENI_FK FOREIGN KEY (MBR_VLASNIKA) REFERENCES ZAPOSLENI(MBR),
	CONSTRAINT TIP_CK CHECK(TIP IN ('Izvestaj', 'Plan', 'Zapisnik'))
);

--Ispravljena
CREATE TABLE PRAVO_PRISTUPA (
    DOKUMENT NUMBER NOT NULL,
    ZAPOSLENI NUMBER(13,0) NOT NULL,
    DATUM DATE NOT NULL,
    PRAVO CHAR(1) NOT NULL,
    CONSTRAINT PRISTUP_PK PRIMARY KEY(DOKUMENT, ZAPOSLENI),
    CONSTRAINT PRISTUPD_FK FOREIGN KEY(DOKUMENT) REFERENCES DOKUMENT(ID_DOKUMENTA),
    CONSTRAINT PRISTUPZ_FK FOREIGN KEY(ZAPOSLENI) REFERENCES ZAPOSLENI(MBR),
    CONSTRAINT PRAVO_CK CHECK (PRAVO IN ('C', 'P'))
);

INSERT INTO ZAPOSLENI VALUES(100, 'Milan', 'Milos', 'Milanovic', 'Bulevar Nemanjica 99, Nis', 'Administracija');
INSERT INTO ZAPOSLENI VALUES(101, 'Sava', 'Sasa', 'Savic', 'Obilicev Venac 88, Beograd', 'Proizvodnja');
INSERT INTO ZAPOSLENI VALUES(102, 'Ivana', 'Ivan', 'Ivanovic', 'Kornelija Stankovica 77, Novi Sad', 'Proizvodnja');
INSERT INTO ZAPOSLENI VALUES(103, 'Branko', 'Blagoje', 'Brankovic', 'Leskovac, Kralja Milana 66, Leskovac', 'Proizvodnja');
INSERT INTO ZAPOSLENI VALUES(104, 'Jelena', 'Jovan', 'Jelic', 'Kralja Petra 55, Nis', 'Proizvodnja');
INSERT INTO ZAPOSLENI VALUES(105, 'Zoran', 'Zaharije', 'Zoric', 'Jovana Jovanovica Zmaja 5, Zrenjanin', 'Prodaja');

INSERT INTO DOKUMENT VALUES(1, 'Zahtevi', '25-JAN-13', 105, 'Zapisnik');
INSERT INTO DOKUMENT VALUES(2, 'Projektovanje', '15-APR-13', 101, 'Plan');
INSERT INTO DOKUMENT VALUES(3, 'Razvoj', '22-JUN-12', 102, 'Plan');
INSERT INTO DOKUMENT VALUES(4, 'Testiranje', '10-AUG-12', 103, 'Izvestaj');
INSERT INTO DOKUMENT VALUES(5, 'Validacija', '30-SEP-12', 104, 'Izvestaj');
INSERT INTO DOKUMENT VALUES(6, 'Odrzavanje', '11-OCT-12', 102, 'Izvestaj');
INSERT INTO DOKUMENT VALUES(7, 'Porezi', '05-FEB-13', 100, 'Izvestaj');
INSERT INTO DOKUMENT VALUES(8, 'Prihodi', '07-JUL-12', 105, 'Izvestaj');
INSERT INTO DOKUMENT VALUES(9, 'Statut', '09-JAN-13', 100, 'Zapisnik');

INSERT INTO PRAVO_PRISTUPA VALUES(1, 101, '25-JAN-13', 'P');
INSERT INTO PRAVO_PRISTUPA VALUES(1, 100, '25-JAN-13', 'P');
INSERT INTO PRAVO_PRISTUPA VALUES(2, 102, '15-APR-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(2, 103, '17-APR-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(2, 104, '17-APR-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(3, 101, '20-APR-13', 'P');
INSERT INTO PRAVO_PRISTUPA VALUES(4, 101, '10-MAY-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(4, 102, '15-MAY-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(5, 101, '30-APR-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(5, 102, '01-APR-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(6, 101, '11-APR-13', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(8, 100, '07-JUL-12', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(9, 101, '09-JAN-12', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(9, 102, '12-JAN-12', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(9, 103, '12-JAN-12', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(9, 104, '12-JAN-12', 'C');
INSERT INTO PRAVO_PRISTUPA VALUES(9, 105, '12-JAN-12', 'C');

---------------------------------------------------------

--RESENI ZADACI od 1 do 3:

/*
1) Napisati SQL upit kojim se kreira pogled koji sadrži identifikatore,
nazive dokumenata i imena i prezimena svih  zaposlenih koji imaju pravo pristupa nad tim dokumentom. Korišćenjem kreiranog pogleda formirati listu koja sadrži nazive svih doumenata
i za svaki dokument broj zaposlenih koji nad tim dokumentom imaju pravo pristupa.  
Krerianu listu sortirati prema broju zaposlenih koji imaju pravo pristupa u opadajući redoled. (25 poena)
*/

Create view Pogled as
select d.ID_DOKUMENTA, d.Naziv, z.ime, z.prezime
from dokument d, pravo_pristupa p, zaposleni z
where z.mbr=p.zaposleni and d.id_dokumenta=p.dokument
order by d.id_dokumenta

select * from Pogled

select id_dokumenta, naziv, count(*) as Broj_Zaposlenih
from pogled
group by id_dokumenta, naziv
order by  Broj_Zaposlenih DESC

---------------------------------------------------------
/*
2. Napisati SQL naredbu kojom se zaposlenom Milanu Milanoviću dodeljuje privilegija za čitanje na dokumentom 
Održavanje. Prikazati odgovarajuću tabelu nakon izmene podataka. (20 poena) 
*/

insert into Pravo_pristupa(Dokument, zaposleni, Datum, pravo)
values((select ID_DOKUMENTA from dokument where naziv='Odrzavanje'),(select MBR from zaposleni where ime='Milan' and prezime='Milanovic'),sysdate,'C') 

select * from Pravo_pristupa;
---------------------------------------------------------
/*
3) Zbog izmena nad statutom organizacije privremeno je svim zaposlenima ukinut pristup nad dokumentom 
Statut. Napisati SQL naredbu kojom se u bazi podataka evidentiraju ove promene. Prikazati izgled odgovarajuće 
izgled odgovarajuće tabele nakon ažuriranja podataka. 
*/

delete from pravo_pristupa where dokument=(select id_dokumenta from dokument where naziv='Statut');

select * from pravo_pristupa
---------------------------------------------------------