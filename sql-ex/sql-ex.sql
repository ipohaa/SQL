/* Номера задач соответствуют номерам заданий на сайте*/

/*1 Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd*/
SELECT model, speed, hd FROM pc
WHERE price < 500

/*2 Найдите производителей принтеров. Вывести: maker*/
SELECT distinct maker FROM product
WHERE type = 'printer'

/*3 Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.*/
SELECT model, ram, screen FROM laptop
WHERE price > 1000

/*4 Найдите все записи таблицы Printer для цветных принтеров.*/
SELECT * FROM printer
WHERE color = 'y'

/*5 Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.*/
SELECT model, speed, hd FROM pc
WHERE cd in ('12x','24x') and price < 600

/*6(2) Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.*/
SELECT distinct p.maker, l.speed FROM product p, laptop l 
WHERE p.model = l.model and hd >= 10

/*7(2) Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква)*/
select p.model, pc.price from product p, pc
where maker = 'B' and p.model = pc.model
union
select p.model, laptop.price from product p, laptop
where maker = 'B' and p.model = laptop.model
union
select p.model, printer.price from product p, printer
where maker = 'B' and p.model = printer.model

/*8(2) Найдите производителя, выпускающего ПК, но не ПК-блокноты.*/
select maker from product
where type in ('PC')
except
select maker from product
where type in ('Laptop')

/*9 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker*/
select distinct maker from product
join pc on pc.model = product.model
where speed >= 450

/*10 Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price*/
select model, price from printer
where price = (
select max(price) from printer 
)

/*11 Найдите среднюю скорость ПК.*/
select avg(speed) from pc

/*12 Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.*/
select avg(speed) from laptop
where price >1000

/*13 Найдите среднюю скорость ПК, выпущенных производителем A.*/
select avg(speed) from pc, product
where maker = 'A' and pc.model = product.model

/*14 SHIPS*/

/*15 Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD*/
select hd from pc
group by hd
having count(hd)>1

/*16 Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.*/
select distinct a.model, b.model, a.speed, a.ram from pc as a, pc b
where a.speed = b.speed 
and a.ram = b.ram 
and a.model > b.model

/*17 Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed*/

SELECT distinct type, l.model, speed
FROM Laptop l, product p
WHERE speed < All (SELECT speed 
 FROM PC
 ) and p.type = 'Laptop'

/*18 Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price */
select distinct maker, price from printer
join product on product.model = printer.model
where price = (select min(price) from printer where color = 'y') and color = 'y'

/*19 Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.*/
select maker, avg(screen) from product p, laptop l
where p.model = l.model
group by maker

/*20 Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.*/
select distinct maker, count(model) as count_model from product
where type = 'PC'
group by maker
having count(model)>=3

/*21 Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.*/
select distinct maker, max(price) from product p
join pc on pc.model = p.model
group by maker

/*22 Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена*/
select speed, avg(price) from pc
where speed > 600
group by speed

/*23 Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker*/
select maker from product p
join pc on pc.model = p.model
where speed >= 750
intersect 
select maker from product p
join laptop l on l.model = p.model
where speed >= 750

/*24 Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.*/

with union_table as (
select model, price from pc
union all
select  model, price from laptop
union all
select  model, price from printer
)
select distinct model from union_table
where price = (select max(price) from union_table)

/*25 Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker*/
select maker from product
where type ='Printer'
intersect
select maker from product p
join pc on pc.model = p.model
where
ram = (select min(ram) from pc)
and speed = (select max(speed) from pc where ram = (select min(ram) from pc))

/*26 Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.*/
WITH union_table as (
select price from product p
join pc on pc.model=p.model
where maker='A'
union all
select price from product p
join laptop l on l.model=p.model
where maker='A'
)
select avg(price) from union_table

/*27 Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.*/
select distinct maker, avg(hd) from product p
join pc on pc.model = p.model
where type ='PC' and maker in (select maker from product where type ='Printer')
group by maker

/*28 Используя таблицу Product, определить количество производителей, выпускающих по одной модели.*/
select count(maker) qty from product
where maker in (
select maker from product 
group by maker 
having count(model)=1
)

/*35 В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра).
Вывод: номер модели, тип модели.*/
select model, type from product
where model not like '%[^0-9]%' or model not like '%[^A-Z]%'

/*40 Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа. Вывести: maker, type*/

select distinct maker, type from product
where maker in (
select maker 
from product 
group by maker 
having count(model)>1  and count(distinct type)=1
)

