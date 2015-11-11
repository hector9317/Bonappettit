create database if not exists identifier;

use identifier;

create table if not exists counter (
	id int not null auto_increment,
	total int not null,
	PRIMARY KEY(id)
);
