-- Ova baza podataka služi za vođenje prodaje auto dijelova u radnji.
-- U njoj se prvo unose proizvođači dijelova i kategorije poput kočnica, 
-- motora ili elektrike. Zatim se evidentiraju svi konkretni 
-- dijelovi sa cijenama i količinama na lageru. Kada kupac dođe,
-- njegovi podaci se upisuju, a kada nešto naruči, 
-- kreira se narudžba koja sadrži sve stavke - šta je tačno naručio i u kojoj količini. 
-- Na taj način možemo pratiti šta se najviše prodaje,
-- ko su naši najbolji kupci i kada treba naručiti nove zalihe.

-- 1:N veze:
--   proizvodjaci - dijelovi, 
--   kategorije - dijelovi,
--   kupci - narudzbe, 
--   narudzbe - stavkeNarudzbe, 
--   dijelovi - stavkeNarudzbe
-- M:N veza:
--   narudzbe - dijelovi

-- ZADATAK 1. KREIRANJE TABELA
-- create table proizvodjaci(
--   proizvodjac_id int primary key auto_increment,
--   naziv varchar(50),
--   adresa varchar(50),
--   telefon varchar(50),
--   email varchar(50)
-- )

-- create table kategorije(
--   kategorija_id int auto_increment primary key,
--   naziv_kategorije varchar(50),
--   opis varchar(50)
-- )

-- create table dijelovi(
--   dio_id int primary key auto_increment,
--   naziv_dijela varchar(50),
--   opis varchar(50),
--   cijena decimal(10,2),
--   kolicinaNaStanju int,
--   proizvodjac_id int,
--   kategorija_id int,

--   foreign key(proizvodjac_id) references proizvodjaci(proizvodjac_id),
--   foreign key(kategorija_id) references kategorije(kategorija_id)
-- )

-- create table kupci(
--   kupac_id int primary key auto_increment,
--     ime varchar(50) not null ,
--     prezime varchar(50) not null,
--     adresa varchar(200),
--     grad varchar(50),
--     telefon varchar(20),
--     email varchar(100)
-- )

-- create table narudzbe(
--   narudzba_id int primary key auto_increment,
--   kupac_id int,
--   datumNarudzbe date not null,
--   ukupnaCijena decimal(10,2),
--   status varchar(20),
--   foreign key(kupac_id) references kupci(kupac_id)
-- )

-- create table stavkeNarudzbe(
--   stavka_id int primary key auto_increment,
--   narudzba_id int,
--   dio_id int,
--   kolicina int,
--   cijenaPoKomadu decimal(10,2),

--   foreign key(narudzba_id)references narudzbe(narudzba_id),
--   foreign key(dio_id) references dijelovi(dio_id)
-- )

-- ZADATAK 2 INSERT PODATAKA 

-- INSERT INTO proizvodjaci (naziv, adresa, telefon, email) VALUES
-- ('Bosch', 'Njemačka', '+49 711 8110', 'info@bosch.com'),
-- ('Continental', 'Njemačka', '+49 511 9380', 'contact@continental.com'),
-- ('Valeo', 'Francuska', '+33 1 40 55 20', 'info@valeo.com'),
-- ('Magneti Marelli', 'Italija', '+39 011 0031111', 'info@marelli.com'),
-- ('ZF Friedrichshafen', 'Njemačka', '+49 7541 770', 'info@zf.com');


-- INSERT INTO kategorije (naziv_kategorije, opis) VALUES
-- ('Kočioni sistemi', 'Kočione pločice, diskovi, cilindri'),
-- ('Motorni dijelovi', 'Filteri, svjećice, remenjevi'),
-- ('Elektrika i osvjetljenje', 'Baterije, svjetla, alternatori'),
-- ('Ovjes i upravljač', 'Amortizeri, opruge, ležajevi'),
-- ('Ispušni sistemi', 'Auspuh, katalizatori, lambda sonde');



-- INSERT INTO dijelovi (naziv_dijela, opis, cijena, kolicinaNaStanju, proizvodjac_id, kategorija_id) VALUES
-- ('Kočione pločice Bosch', 'Prednje kočione pločice', 45.99, 25, 1, 1),
-- ('Zračni filter Continental', 'Zračni filter za diesel', 18.50, 40, 2, 2),
-- ('Prednje svjetlo Valeo', 'Lijevo prednje svjetlo', 89.99, 15, 3, 3),
-- ('Amortizer Magneti Marelli', 'Prednji amortizer', 65.00, 30, 4, 4),
-- ('Lambda sonda ZF', 'Univerzalna lambda sonda', 120.00, 12, 5, 5);


-- INSERT INTO kupci (ime, prezime, adresa, grad, telefon, email) VALUES
-- ('Marko', 'Marković', 'Bulevar Oslobođenja 12', 'Beograd', '+381 11 123456', 'marko@email.com'),
-- ('Ana', 'Anić', 'Vojvode Stepe 45', 'Novi Sad', '+381 21 654321', 'ana@email.com'),
-- ('Ivan', 'Ivanović', 'Knez Mihailova 23', 'Beograd', '+381 11 789012', 'ivan@email.com'),
-- ('Jelena', 'Jelenković', 'Futoška 78', 'Novi Sad', '+381 21 345678', 'jelena@email.com'),
-- ('Petar', 'Petrović', 'Bulevar Kralja Petra 56', 'Niš', '+381 18 901234', 'petar@email.com');


-- INSERT INTO narudzbe (kupac_id, datumNarudzbe, ukupnaCijena, status) VALUES
-- (1, '2024-01-15', 164.98, 'Završeno'),
-- (2, '2024-01-16', 89.99, 'U obradi'),
-- (3, '2024-01-17', 240.00, 'Naručeno'),
-- (4, '2024-01-18', 65.00, 'Isporučeno'),
-- (5, '2024-01-19', 37.00, 'U obradi');

-- INSERT INTO stavkeNarudzbe (narudzba_id, dio_id, kolicina, cijenaPoKomadu) VALUES
-- (1, 1, 2, 45.99),
-- (1, 2, 1, 18.50),
-- (2, 3, 1, 89.99),
-- (3, 5, 2, 120.00),
-- (4, 4, 1, 65.00),
-- (5, 2, 2, 18.50);

-- ZADATAK 3 UPITI ZA POVEZIVANJWE TABELA
-- UPIT 1 inner join : PRIKAZATI LISTU SVIH NARUDZBI ZAJEDNO SA PODACIMA O KUPCIMA

-- select narudzbe.narudzba_id ,kupci.ime, narudzbe.datumNarudzbe, narudzbe.ukupnaCijena, narudzbe.status  from narudzbe
-- join kupci
-- on kupci.kupac_id = narudzbe.kupac_i

-- UPIT 2 left join: Prikaži sve dijelove i broj narudžbi u kojima se pojavljuju

-- select dijelovi.naziv_dijela, dijelovi.cijena, count(narudzbe.narudzba_id) as brojnarudzbi
-- from stavkeNarudzbe
-- left join narudzbe
-- on stavkeNarudzbe.narudzba_id = narudzbe.narudzba_id
-- left join dijelovi
-- on stavkeNarudzbe.dio_id = dijelovi.dio_id
-- group by dijelovi.naziv_dijela,dijelovi.cijena


-- upit 3 right join: Prikaži sve kupce i njihove narudžbe (uključujući i kupce bez narudžbi

-- select ime, prezime, grad, narudzbe.datumNarudzbe
-- from narudzbe
-- right join kupci
-- on narudzbe.kupac_id = kupci.kupac_id

-- zadatak 4
-- upit 1: najmanja cijena
-- select min(cijena) from dijelovi

-- upit 2: najveca cijena
-- select max(cijena) from dijelovi

-- upit 3: Prikaši ukupnu vrijednost dijelova po kategorijama
-- select sum(dijelovi.cijena), kategorija_id from dijelovi
-- group by kategorija_id

-- upit 4: case grupiraj cijene 
-- select naziv_dijela, cijena,
-- case
--   when cijena < 50 then 'Jeftino'
--   else 'Skupo'
-- end as kateggorijaCijena
-- from dijelovi

-- upit 5: any  rikaži sve dijelove koji su skuplji od BILO KOJEG dijela proizvođača "Valeo"
-- select naziv_dijela, cijena, proizvodjaci.naziv from dijelovi
-- join proizvodjaci on dijelovi.proizvodjac_id = proizvodjaci.proizvodjac_id
-- where cijena > any(select cijena from dijelovi where proizvodjac_id = (select proizvodjac_id from proizvodjaci where naziv = 'Valeo'))

-- upit 6: all Prikaži sve dijelove koji su jeftiniji od SVIH dijelova proizvođača "ZF Friedrichshafen"
-- select naziv_dijela, cijena, proizvodjaci.naziv from dijelovi
-- join proizvodjaci on dijelovi.proizvodjac_id = proizvodjaci.proizvodjac_id
-- where cijena < all(select cijena from dijelovi where proizvodjac_id = (select proizvodjac_id from proizvodjaci where naziv = 'ZF Friedrichshafen'))


-- zadatak 5
-- upit 1: Ažuriraj telefon proizvođača "Bosch" na novi broj telefona 49 711 9999

-- update proizvodjaci
-- set telefon = '+49 711 9999'
-- where naziv = 'Bosch'

-- upit 2: Ažuriraj status narudžbe kupca "Marko Marković" na 'Isporučeno'
-- update narudzbe
-- set status = 'Isporuceno'
-- where kupac_id = (select kupac_id from kupci where ime = 'Marko' and prezime = 'Marković');

-- zadatak 6
-- Pokušaj obrisati proizvođača "Bosch" iz tabele proizvodjaci
-- delete from proizvodjaci
-- where naziv = 'Bosch'

-- upit 2: briši sve stavke narudžbi iz tabele stavkeNarudzbe koje imaju količinu manju od 2
-- delete from stavkeNarudzbe
-- where kolicina < 2




