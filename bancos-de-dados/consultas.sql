-- Ver quais itens estão próximos da validade e em qual base estão, em ordem crescente
SELECT name_item, validate_item, name_collect_point
FROM item
INNER JOIN item_base ON item_base.id_item = item.id_item
INNER JOIN collect_point ON collect_point.id_collect_point = item_base.id_base
WHERE validate_item >= CURRENT_DATE 
ORDER BY validate_item ASC;

-- Ver quais abrigos têm capacidade superior a X pessoas e seu contato
SELECT name_shelter, phone_shelter, capacity_shelter
FROM shelter
WHERE capacity_shelter > 100;

-- Ver todos os abrigos com uma classificação maior que X
SELECT name_shelter, rating_shelter
FROM shelter 
WHERE rating_shelter > 4;

-- Ver quantos itens da categoria X existem no ponto de coleta
SELECT SUM(quantity_item) AS total_quantity, name_item, collect_point.name_collect_point
FROM item
INNER JOIN item_base ON item.id_item = item_base.id_item AND item.type_item = 'Higiênico'
INNER JOIN collect_point ON collect_point.id_collect_point = item_base.id_base
GROUP BY name_item, collect_point.name_collect_point;

-- Ver todas as catástrofes ocorridas no ano X
SELECT * 
FROM catastrophe
WHERE YEAR(day_catastrophe) = 2020;

-- Ver quais itens no ponto de coleta estão escassos (ABAIXO de X)
SELECT name_item, quantity_item, name_collect_point
FROM item
INNER JOIN item_base ON item_base.id_item = item.id_item
INNER JOIN collect_point ON item_base.id_base = collect_point.id_collect_point
WHERE quantity_item < 20;

-- Verificar os tipos de catastrofes mais recentes e sua gravidade.
SELECT name_catastrophe,  day_catastrophe, type_catastrophe, current_situation_catastrophe
FROM catastrophe 
WHERE day_catastrophe < CURRENT_DATE
ORDER BY day_catastrophe DESC;

-- Verificar em quais estados mais ocorrem catástrofes
SELECT SUM(catastrophe.id_catastrophe) as quantidade,  adress.state_adress as estado
FROM catastrophe
INNER JOIN adress ON catastrophe.id_catastrophe = adress.id_catastrophe
GROUP BY adress.state_adress; 

-- Ver quantos abrigos tem em cada estado
SELECT SUM(shelter.id_shelter) as quantidade, adress.state_adress as estado
FROM shelter
INNER JOIN adress ON shelter.id_adress = adress.id_adress
GROUP BY adress.state_adress;

-- Ver a média de avaliação dos pontos de coleta em cada estado
SELECT AVG(rating_collect_point) AS avg_rating, adress.state_adress
FROM collect_point
INNER JOIN adress ON collect_point.id_adress = adress.id_adress
GROUP BY adress.state_adress;

-- Ver o número de abrigos por tipo de catástrofe:
SELECT type_catastrophe, COUNT(*) AS num_shelters
FROM catastrophe
JOIN shelter ON catastrophe.id_catastrophe = shelter.id_adress
GROUP BY type_catastrophe;

-- Ver a capacidade total dos abrigos por tipo de catástrofe:
SELECT type_catastrophe, SUM(capacity_shelter) AS total_capacity
FROM catastrophe
JOIN shelter ON catastrophe.id_catastrophe = shelter.id_adress
WHERE shelter.id_shelter = '3'
GROUP BY type_catastrophe;

--Ver o número de pontos de coleta por estado:
SELECT state_adress, COUNT(*) AS num_collect_points
FROM collect_point
JOIN adress ON collect_point.id_adress = adress.id_adress
GROUP BY state_adress;

-- Ver a classificação média dos abrigos por cidade:
SELECT city_adress, AVG(rating_shelter) AS avg_rating
FROM shelter
JOIN adress ON shelter.id_adress = adress.id_adress
GROUP BY city_adress;

--Veer o número de itens doados por ponto de coleta:
SELECT name_collect_point, COUNT(*) AS num_donated_items
FROM collect_point
JOIN item_base ON collect_point.id_adress = item_base.id_base
GROUP BY name_collect_point;
