-- Создание таблицы employees
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
); 

-- Наполнение таблицы *employees данными 
insert into employees (employee_name)
values ('Алиса Щербакова'),
('Максим Черкасов'),
('Карина Хохлова'),
('Дарья Попова'),
('Ксения Майорова'),
('Яна Осипова'),
('Вера Иванова'),
('Полина Соловьева'),
('Тимофей Наумов'),
('Илья Шестаков'),
('Юрий Ларионов'),
('Маргарита Свиридова'),
('Илья Степанов'),
('Вера Гаврилова'),
('Иван Воробьев'),
('Михаил Сорокин'),
('Константин Блинов'),
('Анжелика Виноградова'),
('Евгения Романова'),
('Кирилл Быков'),
('Мария Кузнецова'),
('Варвара Семенова'),
('Артём Волков'),
('Мирон Трофимов'),
('Степан Софронов'),
('Александра Измайлова'),
('Мария Савельева'),
('Елена Воронина'),
('Милана Беликова'),
('Алиса Никулина'),
('Ангелина Киселева'),
('Дмитрий Пономарев'),
('Арсен Богданов'),
('Глеб Булгаков'),
('Софья Устинова'),
('Елена Миронова'),
('Мирон Соловьев'),
('Александр Виноградов'),
('Арина Соловьева'),
('Елизавета Соловьева'),
('Вероника Ларина'),
('Арсений Синицын'),
('Варвара Волкова'),
('София Волкова'),
('Юлия Андрианова'),
('Павел Васильев'),
('Давид Фомин'),
('Тимофей Королев'),
('Арина Поликарпова'),
('Мария Панова'),
('Лев Косарев'),
('Дмитрий Ерофеев'),
('Кирилл Филиппов'),
('Софья Зыкова'),
('Максим Рябинин'),
('Евгений Макаров'),
('Фёдор Иванов'),
('Виктория Потапова'),
('Станислав Петров'),
('Степан Широков'),
('Даниил Платонов'),
('Александра Глухова'),
('Андрей Ефимов'),
('Мария Еремина'),
('Даниил Серов'),
('Никита Быков'),
('Святослав Григорьев'),
('Илья Андреев'),
('Михаил Ершов'),
('Георгий Леонов');

-- Создание таблицы salary 
create table salary(
	id serial primary key,
	monthly_salary int not null unique
);

-- Наполнение таблицы *salary данными 
insert into  salary (monthly_salary)
values (1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);


-- Создание таблицы employee_salary 
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- Наполнение таблицы *employee_salary данными 
insert into employee_salary (employee_id, salary_id)
values (3,7),(1,4),(5,9),(40,13),(23,4),(11,2),(52,10),(15,13),(26,4),(16,1),(33,7);

-- Создание таблицы roles 
create table roles (
	id serial primary key,
	role_name int not null unique
);

-- Смена типа данных в столбце *role_name на varchar(30) 
alter table roles
alter column role_name type varchar(30);

-- Наполнение таблицы *roles данными 
insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales Manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

-- Создание таблицы roles_employee 
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	foreign key (employee_id) 
		references employees(id),
	role_id int not null,
	foreign key (role_id)
		references roles(id)
);

-- Наполнение таблицы *roles_employee данными 
insert into roles_employee (employee_id, role_id)
values (7,2),
(20,4),
(3,9),
(5,13),
(23,4),
(11,2),
(10,9),
(22,13),
(21,3),
(34,4),
(6,7),
(68,19),
(29,10),
(30,20),
(18,14),
(58,1),
(53,16),
(70,8),
(51,17),
(49,11),
(36,15),
(13,6),
(55,5),
(41,12),
(24,18),
(8,17),
(33,8),
(47,11),
(62,16),
(14,14),
(1,1),
(28,6),
(39,14),
(59,8),
(2,20),
(64,11),
(16,12),
(25,19),
(57,7),
(46,18);
