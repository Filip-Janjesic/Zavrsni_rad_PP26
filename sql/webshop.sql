drop database if exists webshop;
create database webshop default character set utf8mb4;
use webshop;

create table proizvod (
    sifra int primary key auto_increment not null,
    naziv varchar(50) not null,
    proizvodac varchar(255) not null,
    cijena decimal(18.2) not null,
    slika varchar(255) not null
);

