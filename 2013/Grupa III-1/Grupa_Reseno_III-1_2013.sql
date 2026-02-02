--TABELE I UNOS

CREATE TABLE BIBLIOTEKA
(   
ID NUMBER(10),
NAZIV VARCHAR2(30),
CONSTRAINT BIBLIOTEKA_PK PRIMARY KEY (ID)
);

CREATE TABLE KNJIGA 
(	
    ISBN NUMBER(10) NOT NULL ENABLE, 
    NASLOV VARCHAR2(30) NOT NULL ENABLE, 
    DATUM_OBJAVLJIVANJA DATE, 
    CONSTRAINT KNJIGA_PK PRIMARY KEY (ISBN)
);

CREATE TABLE KNJIGA_U_BIBLIOTECI
(	
  ID_BIBLIOTEKE NUMBER(10), 
	ISBN_KNJIGE NUMBER(10), 
	KOLICINA NUMBER(3) NOT NULL CHECK(KOLICINA > 0), 
	CONSTRAINT KNJIGA_U_BIBLIOTECI_PK PRIMARY KEY (ID_BIBLIOTEKE, ISBN_KNJIGE),
  CONSTRAINT KNJIGA_FK FOREIGN KEY (ISBN_KNJIGE) REFERENCES KNJIGA (ISBN), 
  CONSTRAINT BIBLIOTEKA_FK FOREIGN KEY (ID_BIBLIOTEKE) REFERENCES BIBLIOTEKA (ID)
);

Insert into BIBLIOTEKA (ID,NAZIV) values (2,'Biblioteka Mediana');
Insert into BIBLIOTEKA (ID,NAZIV) values (3,'Biblioteka Svetozar Markovic');
Insert into BIBLIOTEKA (ID,NAZIV) values (4,'Biblioteka Sv.Naum');
Insert into BIBLIOTEKA (ID,NAZIV) values (5,'Biblioteka Matice Srpske');
Insert into BIBLIOTEKA (ID,NAZIV) values (6,'Biblioteka Krusevac');
Insert into BIBLIOTEKA (ID,NAZIV) values (1,'Narodna biblioteka');

Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (1234567892,'Beli Tigar',to_timestamp('12-MAR-75','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (3,'Znakovi',to_timestamp('23-MAY-79','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (4,'Prokleta avlija',to_timestamp('05-OCT-69','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (5,'Led',to_timestamp('30-JUL-81','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (6,'Deca',to_timestamp('17-JAN-77','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (7,'Vreme smrti',to_timestamp('27-OCT-79','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (8,'Gresnik',to_timestamp('28-OCT-83','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (9,'Izabrana dela',to_timestamp('30-OCT-89','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (10,'Mrtvo more',to_timestamp('01-NOV-69','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (11,'Dozivljaji Nikoletine Bursaca',to_timestamp('03-NOV-99','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (12,'Orlovi rano lete',to_timestamp('04-NOV-79','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (13,'Djecak prati zmaja',to_timestamp('04-NOV-81','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (14,'Ocevi i oci',to_timestamp('04-NOV-83','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (15,'Cekajuci Godoa',to_timestamp('08-NOV-50','DD-MON-RR HH.MI.SSXFF AM'));
Insert into KNJIGA (ISBN,NASLOV,DATUM_OBJAVLJIVANJA) values (1234567891,'Na drini cuprija',to_timestamp('08-NOV-72','DD-MON-RR HH.MI.SSXFF AM'));

Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,1234567892,2);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,3,4);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,4,7);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,10,4);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,9,1);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,8,3);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,5,9);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,14,4);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,15,4);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,13,6);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,12,8);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,11,3);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,10,5);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,9,2);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,8,1);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,7,6);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (2,3,2);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,10,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,9,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,8,11);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,7,9);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,6,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,5,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,4,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,3,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (4,1234567891,10);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,1234567892,8);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,1234567891,8);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,3,8);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,4,5);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,5,5);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,15,7);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,14,9);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (3,13,2);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,1234567892,1);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,1234567891,2);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,8,3);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,7,4);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,6,5);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,9,6);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,10,7);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,12,8);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (5,14,9);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,12,12);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,13,11);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,15,2);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,11,3);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,6,5);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,8,4);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (6,3,7);
Insert into KNJIGA_U_BIBLIOTECI (ID_BIBLIOTEKE,ISBN_KNJIGE,KOLICINA) values (1,1234567891,6);
--------------------------------------------------------------------------------

--Zadaci od 1-3:

/*
1) Napisati SQL upit kojim se kreira pogled IMA_PROKLETU_AVLIJU koji sadrži nazive biblioteka koje imaju bar 
jedan primerka knjige Prokleta avlija. Korišćenjem kreiranog pogleda odrediti naziv biblioteke koja ima najviše 
primeraka knjige Prokleta avlija. (25 poena)
*/

create view IMA_PROKLETU_AVLIJU as
select b.naziv, kb.kolicina
from biblioteka b, knjiga k, knjiga_u_biblioteci kb
where b.id=kb.id_biblioteke and kb.isbn_knjige=k.isbn and k.naslov='Prokleta avlija' and kb.kolicina>0

select naziv from IMA_PROKLETU_AVLIJU 
order by kolicina desc
fetch first row only

select * from IMA_PROKLETU_AVLIJU

--------------------------------------------------------------------------------

/*
2)U sistemu se pojavila nova knjiga Ljubav u doba kolere (ISBN: 100, datum izdavanja: 01/01/2010. godine). 
Napisati SQL naredbu kojom se ova knjiga dodaje u system. Prikazati SQL naredbu za ažuriranje i rezultujuću 
tabelu sa promenjenim podacima. (20 poena)
*/

insert into knjiga 
values (100,'Ljubav u doba kolere','01-JAN-10');

select * from knjiga;

--------------------------------------------------------------------------------

/*
3)Napisati SQL upite kojima se tri primerka knjige Prokleta avlija prebacujue iz biblioteke Biblioteka Sv.Naum u 
biblioteku Biblioteka Krusevac.
*/
update knjiga_u_biblioteci 
set kolicina=kolicina-3 
where id_biblioteke=(select biblioteka.ID from biblioteka where naziv='Biblioteka Sv.Naum') and isbn_knjige=(select isbn from knjiga where naslov='Prokleta avlija');

insert into knjiga_u_biblioteci 
values( (select biblioteka.ID from biblioteka where naziv='Biblioteka Krusevac'), (select isbn from knjiga where naslov='Prokleta avlija'),3);

--------------------------------------------------------------------------------
