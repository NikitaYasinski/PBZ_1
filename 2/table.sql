CREATE TABLE suppliers (
	id VARCHAR(2) PRIMARY KEY,
    lastname VARCHAR(20),
    stat INT,
    city VARCHAR(20)
);

INSERT suppliers(id, lastname, stat, city)
VALUES
('П1', 'Петров', 20, 'Москва'),
('П2', 'Синицин', 10, 'Таллинн'),
('П3', 'Федоров', 30, 'Таллинн'),
('П4', 'Чаянов', 20, 'Минск'),
('П5', 'Крюков', 30, 'Киев');

CREATE TABLE details (
	id VARCHAR(2) PRIMARY KEY,
    nameD VARCHAR(20),
    color VARCHAR(20),
    size INT,
    city VARCHAR(20)
);

INSERT details(id, nameD, color, size, city)
VALUES
('Д1', 'Болт', 'Красный', 12, 'Москва'),
('Д2', 'Гайка', 'Зеленая', 17, 'Минск'),
('Д3', 'Диск', 'Черный', 17, 'Вильнюс'),
('Д4', 'Диск', 'Черный', 14, 'Москва'),
('Д5', 'Корпус', 'Красный', 12, 'Минск'),
('Д6', 'Крышки', 'Красный', 19, 'Москва');

CREATE TABLE projects (
	id VARCHAR(3) PRIMARY KEY,
    namePr VARCHAR(4),
    city VARCHAR(20)
);

INSERT projects(id, namePr, city)
VALUES
('ПР1', 'ИПР1', 'Минск'),
('ПР2', 'ИПР2', 'Таллинн'),
('ПР3', 'ИПР3', 'Псков'),
('ПР4', 'ИПР4', 'Псков'),
('ПР5', 'ИПР5', 'Москва'),
('ПР6', 'ИПР6', 'Саратов'),
('ПР7', 'ИПР7', 'Москва');

CREATE TABLE details_amount (
	supplier_id VARCHAR(2) REFERENCES supplier(id),
    item_id VARCHAR(2) REFERENCES details(id),
    project_id VARCHAR(3) REFERENCES projects(id),
    amount INT
);

INSERT details_amount(supplier_id, item_id, project_id, amount)
VALUES
('П1', 'Д1', 'ПР1', 200), ('П1', 'Д1', 'ПР2', 700), ('П2', 'Д3', 'ПР1', 400), 
('П2', 'Д2', 'ПР2', 200), ('П2', 'Д3', 'ПР3', 200), ('П2', 'Д3', 'ПР4', 500), 
('П2', 'Д3', 'ПР5', 600), ('П2', 'Д3', 'ПР6', 400), ('П2', 'Д3', 'ПР7', 800), 
('П2', 'Д5', 'ПР2', 100), ('П3', 'Д3', 'ПР1', 200), ('П3', 'Д4', 'ПР2', 500), 
('П4', 'Д6', 'ПР3', 300), ('П4', 'Д6', 'ПР7', 300), ('П5', 'Д2', 'ПР2', 200),
('П5', 'Д2', 'ПР4', 100), ('П5', 'Д5', 'ПР5', 500), ('П5', 'Д5', 'ПР7', 100), 
('П5', 'Д6', 'ПР2', 200), ('П5', 'Д1', 'ПР2', 100), ('П5', 'Д3', 'ПР4', 200), 
('П5', 'Д4', 'ПР4', 800), ('П5', 'Д5', 'ПР4', 400), ('П5', 'Д6', 'ПР4', 500); 

