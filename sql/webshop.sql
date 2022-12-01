# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\korisniks\Filip\Documents\Edunova-2022\Zavrsni_rad_PP26\sql\webshop.sql

drop database if exists webshop;
create database webshop default character set utf8mb4;
use webshop;

create table proizvod (

    sifra int primary key auto_increment not null,
    naziv varchar(50) not null,
    proizvodac varchar(255) not null,
    cijena decimal(18.2) not null,
    slika varchar(255) not null,
    kategorija int not null 

);

create table korisnik (

    sifra int primary key auto_increment not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    lozinka char(50) not null,
    email varchar(50) not null

);

create table narudzba (

    sifra int primary key auto_increment not null,
    status varchar(50) not null,
    korisnik int

);

create table kategorija(

	sifra int primary key auto_increment not null,
	naziv varchar(50)

);

create table komentar(

	sifra int primary key auto_increment not null,
	korisnik int,
    proizvod int,
    komentar text

);

create table ocjena(

	sifra int primary key auto_increment not null,
	korisnik int,
    proizvod int,
    ocjena int(1)

);

create table kupljeno(

	sifra int primary key auto_increment not null,
	narudzba int,
    proizvod int,
    cijena decimal(18,2)

);

create table dijaprojekcija(

	sifra int primary key auto_increment not null,
	slika varchar(255) not null,
	vsifraljivo varchar (1) 

);

alter table kupljeno add foreign key (narudzba) references narudzba(sifra);
alter table kupljeno add foreign key (proizvod) references proizvod(sifra);

alter table proizvod add foreign key (kategorija) references kategorija(sifra);
alter table narudzba add foreign key (korisnik) references korisnik(sifra);

alter table komentar add foreign key (proizvod) references proizvod(sifra);
alter table komentar add foreign key (korisnik) references korisnik(sifra) on delete cascade;

alter table ocjena add foreign key (proizvod) references proizvod(sifra);
alter table ocjena add foreign key (korisnik) references korisnik(sifra) on delete cascade;