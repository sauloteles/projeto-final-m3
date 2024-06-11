CREATE DATABASE conectados;
USE conectados;

CREATE TABLE item (
	id_item INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_item VARCHAR(255) NOT NULL,
    type_item VARCHAR(255),
    quantity_item INTEGER NOT NULL,
    validate_item DATE NOT NULL
);

CREATE TABLE catastrophe (
	id_catastrophe INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_catastrophe VARCHAR(255),
	day_catastrophe TIMESTAMP,
    type_catastrophe VARCHAR(255) NOT NULL,
    current_situation_catastrophe VARCHAR(255),
    level_catastrophe VARCHAR(255)
);

CREATE TABLE adress (
	id_adress INTEGER PRIMARY KEY AUTO_INCREMENT,
    cep_adress CHAR(8) NOT NULL,
    state_adress VARCHAR(255) NOT NULL,
    city_adress VARCHAR(255),
    neighborhood_adress VARCHAR(255),
    street_adress VARCHAR(255),
    id_catastrophe INTEGER NOT NULL,
    
    FOREIGN KEY (id_catastrophe) REFERENCES catastrophe (id_catastrophe)
);

CREATE TABLE user (
	cpf_user CHAR(11) PRIMARY KEY,
    name_user VARCHAR(255) NOT NULL,
    phone_number_user CHAR(13),
    email_user VARCHAR(255) NOT NULL,
    password_user VARCHAR(255) NOT NULL
);

CREATE TABLE shelter (
	id_shelter INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_shelter VARCHAR(255) NOT NULL,
    phone_shelter CHAR(13),
    email_shelter VARCHAR(255),
    rating_shelter INTEGER,
    capacity_shelter INTEGER NOT NULL,
    id_adress INTEGER NOT NULL,
    cpf_user CHAR(11) NOT NULL,
    
    FOREIGN KEY (id_adress) REFERENCES adress (id_adress),
    FOREIGN KEY (cpf_user) REFERENCES user (cpf_user)
);

CREATE TABLE collect_point (
	id_collect_point INTEGER PRIMARY KEY AUTO_INCREMENT,
	name_collect_point VARCHAR(255) NOT NULL,
	phone_collect_point CHAR(13),
	email_collect_point VARCHAR(255),
    rating_collect_point INTEGER,
	id_adress INTEGER NOT NULL,
    cpf_user CHAR(11) NOT NULL,
    
    FOREIGN KEY (id_adress) REFERENCES adress (id_adress),
    FOREIGN KEY (cpf_user) REFERENCES user (cpf_user)
);

CREATE TABLE item_base (
	id_item INTEGER,
    id_base INTEGER,
    
    PRIMARY KEY (id_item, id_base),
    FOREIGN KEY (id_base) REFERENCES collect_point (id_collect_point),
    FOREIGN KEY (id_base) REFERENCES shelter (id_shelter)
);

