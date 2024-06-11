INSERT INTO user (cpf_user, name_user, phone_number_user, email_user, password_user) VALUES 
	("10000000000", "Edson Araújo", "73988888888", "edsonaraujodesouzaneto@gmail.com", "edson2024"),
    ("99000000000", "Deborah Fagundes", "21977777777", "DeborahFagundes@gmail.com", "deborah123"),
    ("15000000000", "Sarah Pereira", "33577777777", "SarahPereira@gmail.com", "sarahsarah"),
    ("90000000099", "Saulo", "33577777777", "saulopda@gmail.com", "saulinho2020"),
    ("66000000000", "Rebeca", "55577777777", "rebeca@gmail.com", "rebeca15");

INSERT INTO catastrophe ( day_catastrophe,name_catastrophe, type_catastrophe, current_situation_catastrophe, level_catastrophe) VALUES
	("2020-04-16","BadSuzano" ,"Grave", null, null),
    ("2024-05-16", null,"Muito Grave", "Crítica", "Municipal"),
    ("2024-01-10", "Day noHappy" ,"Médio", null, null),
    (null,null, "Grave", null, null),
    ("2020-01-10","O ultimo dia", "Médio", "Estável", "Estadual");
    
INSERT INTO item (name_item, type_item, quantity_item, validate_item) VALUES
	("Desodorante", "Higiênico", "200", "2026-04-04"),
    ("Escova de dentes", "Higiênico", "1000", "2025-01-01"),
    ("Feijão", "Alimento", "20", "2025-10-01"),
    ("Arroz", "Alimento", "10", "2026-04-04"),
    ("Macarrão", "Alimento", "50", "2026-04-04");

INSERT INTO adress (cep_adress, state_adress, city_adress, neighborhood_adress, street_adress, id_catastrophe) VALUES
	("45700150", "São Paulo", "Itaquaquecetuba", null, null, 1),
    ("45000001", "Bahia", "Salvador", "São Cruz", "Rua Flamengo", 2),
	("55700150", "Rio Grande", "Jequiba", "Itachi", "Rua Danzo", 3),
	("45700150", "Bahia", "Jequie", "All Might", "Rua Edgar Argolo", 5),
    ("45700150", "Bahia", "Ipiaú", "ACM", "Rua do Sapo", 5);

INSERT INTO shelter (name_shelter, phone_shelter, email_shelter, rating_shelter, capacity_shelter, id_adress, cpf_user) VALUES
	("São Salvador", "77999502140", null, null, 50, 2, "10000000000"),
    ("Irmã Dulce", "77999276044", "irmadulceabrigo@gmail.com", 5, 100, 2, "90000000099"),
    ("Dias melhores", null, null, 3, 10, 3, "99000000000"),
    ("Candeias", "33988403026", null, 5, 10, 4, "66000000000"),
    ("Urbis", null, "abrigourbis@gmail.com", null, 1000, 4, "15000000000");

INSERT INTO collect_point (name_collect_point, phone_collect_point, email_collect_point, rating_collect_point,  id_adress, cpf_user ) VALUES
	("CREAS II", "77988402320", "creasii@gmail.com", 5,1, "10000000000"),
	("APOIO++", "35314024", "apoiomaismais@gmail.com", 4,3, "66000000000"),
    ("Centro de Coleta SP", "21999402127", "CCSP@gmail.com", 5,4, "15000000000"),
    ("RECUPERA BAHIA", "77988402320", "recuperabahia@gmail.com", 3,2, "99000000000"),
    ("Centro Uchiha", null, "centrouchiha@gmail.com", 5,2, "10000000000");

INSERT INTO item_base (id_item, id_base) VALUES
	(1,1),
    (4,2),
    (1,3),
    (2,3),
    (2,2);

SELECT * FROM user;
SELECT * FROM catastrophe;
SELECT * FROM item;
SELECT * FROM adress;
SELECT * FROM shelter;
SELECT * FROM collect_point;
SELECT * FROM item_base;
    