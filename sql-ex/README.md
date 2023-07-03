### Решение задач 1-30, 35, 40 обучающего этапа с сайта [SQL-EX.RU](sql-ex.ru)

### Быстрая навигация
[#1 ]()
[#2 ]() 
[#3 ]() 
[#4 ]() 
[#5 ]() 
[#6 ]() 
[#7 ]() 
[#8 ]() 
[#9 ]() 
[#10]() 
[#11]() 
[#12]() 
[#13]() 
[#15]() 
[#16]()
[#17]()\
[#18]() 
[#19]() 
[#20]()
[#21 ]() 
[#22 ]()
[#23 ]() 
[#24 ]() 
[#25 ]()
[#26 ]()
[#27 ]() 
[#28 ]() 
[#35 ]() 
[#40]()

### Список задач
+ [1 Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.]()
+ [2. Найдите производителей принтеров.]()
+ [3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.]()
+ [4. Найдите все записи таблицы Printer для цветных принтеров.]()
+ [5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.]()
+ [6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости...]()
+ [7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква)]()
+ [8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.]()
+ [9. Найдите производителей ПК с процессором не менее 450 Мгц.]()
+ [10. Найдите модели принтеров, имеющих самую высокую цену.]()
+ [11. Найдите среднюю скорость ПК.]()
+ [12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.]()
+ [13. Найдите среднюю скорость ПК, выпущенных производителем A.]()
+ [15. Найдите размеры жестких дисков, совпадающих у двух и более PC.]()
+ [16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM.]()
+ [17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.]()
+ [18. Найдите производителей самых дешевых цветных принтеров.]()
+ [19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ...]()
+ [20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК.]()
+ [21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.]()
+ [22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью.]()
+ [23. Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скор...]()
+ [24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.]()
+ [25. Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором ...]()
+ [26. Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква).]()
+ [27. Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры.]()
+ [28. Используя таблицу Product, определить количество производителей, выпускающих по одной модели.]()
+ [35. В таблице Product найти модели, которые состоят только из цифр или только из латинских букв ...]()
+ [40. Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем ... ]()
  

### 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. 
Вывести: model, speed и hd 
``` 
SELECT model, speed, hd 
FROM pc 
WHERE price < 500 
``` 

### 2. Найдите производителей принтеров. 
Вывести: maker 
``` 
SELECT DISTINCT maker 
FROM product 
WHERE type = 'printer' 
``` 

### 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол. 
``` 
SELECT model, ram, screen
FROM laptop 
WHERE price > 1000 
``` 
### 4. Найдите все записи таблицы Printer для цветных принтеров.
``` 
SELECT *
FROM printer 
WHERE color = 'y' 
``` 
### 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол. 
``` 
SELECT model, speed, hd
FROM pc 
WHERE cd IN ('12x','24x') AND price < 600 
``` 
### 6(2). Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
Вывод: производитель, скорость.
``` 
SELECT DISTINCT p.maker, l.speed
FROM product p, laptop l  
WHERE p.model = l.model AND hd >= 10 
``` 
### 7(2). Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква)
``` 
SELECT p.model, pc.price
FROM product p, pc 
WHERE maker = 'B' AND p.model = pc.model 
UNION 
SELECT p.model, laptop.price
FROM product p, laptop 
WHERE maker = 'B' AND p.model = laptop.model 
UNION
SELECT p.model, printer.price
FROM product p, printer 
WHERE maker = 'B' AND p.model = printer.model 
``` 
### 8(2). Найдите производителя, выпускающего ПК, но не ПК-блокноты. 
``` 
SELECT maker
FROM product 
WHERE type IN ('PC') 
EXCEPT 
SELECT maker
FROM product 
WHERE type IN ('Laptop') 
``` 
### 9. Найдите производителей ПК с процессором не менее 450 Мгц. 
Вывести: Maker
``` 
SELECT DISTINCT maker
FROM product 
JOIN pc ON pc.model = product.model 
WHERE speed >= 450 
``` 
### 10. Найдите модели принтеров, имеющих самую высокую цену. 
Вывести: model, price
``` 
SELECT model, price
FROM printer 
WHERE price = (
 SELECT MAX(price) FROM printer  
) 
``` 
### 11. Найдите среднюю скорость ПК.
``` 
SELECT AVG(speed)
FROM pc 
``` 
### 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол. 
``` 
SELECT AVG(speed)
FROM laptop 
WHERE price >1000 
``` 
### 13. Найдите среднюю скорость ПК, выпущенных производителем A.
``` 
SELECT AVG(speed)
FROM pc, product 
WHERE maker = 'A' AND pc.model = product.model 
``` 

### 15(2). Найдите размеры жестких дисков, совпадающих у двух и более PC. 
Вывести: HD 
``` 
SELECT hd
FROM pc 
GROUP BY hd 
HAVING COUNT(hd)>1 
``` 
### 16(2). Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i).\
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
``` 
SELECT DISTINCT a.model, b.model, a.speed, a.ram FROM pc as a, pc b 
WHERE a.speed = b.speed  
AND a.ram = b.ram  
AND a.model > b.model 
``` 
### 17(2). Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. 
Вывести: type, model, speed
``` 
SELECT DISTINCT type, l.model, speed 
FROM Laptop l, product p 
WHERE speed < All (
 SELECT speed  
 FROM PC 
) AND p.type = 'Laptop' 
``` 
### 18(2). Найдите производителей самых дешевых цветных принтеров. 
Вывести: maker, price
``` 
SELECT distinct maker, price
FROM printer 
JOIN product ON product.model = printer.model 
WHERE price = (
 SELECT MIN(price)
 FROM printer
 WHERE color = 'y'
) AND color = 'y' 
``` 
### 19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. 
Вывести: maker, средний размер экрана. 
``` 
SELECT maker, AVG(screen)
FROM product p, laptop l
WHERE p.model = l.model 
GROUP BY maker 
``` 
### 20(2). Найдите производителей, выпускающих по меньшей мере три различных модели ПК. 
Вывести: Maker, число моделей ПК. 
``` 
SELECT distinct maker, count(model) as count_model
FROM product 
WHERE type = 'PC' 
GROUP BY maker 
HAVING COUNT(model)>=3 
``` 
### 21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. 
Вывести: maker, максимальная цена. 
``` 
SELECT DISTINCT maker, MAX(price)
FROM product p 
JOIN pc ON pc.model = p.model 
GROUP BY maker 
```
### 22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. 
Вывести: speed, средняя цена 
``` 
SELECT speed, AVG(price)
FROM pc 
WHERE speed > 600 
GROUP BY speed 
``` 

### 23(2). Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. 
Вывести: Maker 
``` 
SELECT maker
FROM product p 
JOIN pc ON pc.model = p.model 
WHERE speed >= 750 
INTERSECT  
SELECT maker FROM product p 
JOIN laptop l ON l.model = p.model 
WHERE speed >= 750 
``` 

### 24(2). Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции. 
``` 
WITH union_table as ( 
SELECT model, price
FROM pc 
UNION ALL
SELECT  model, price
FROM laptop 
UNION ALL
SELECT  model, price
FROM printer 
) 
SELECT DISTINCT model
FROM union_table 
WHERE price = (
 SELECT MAX(price)
 FROM union_table
) 
``` 
### 25(2). Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. 
Вывести: Maker 
``` 
SELECT maker
FROM product 
WHERE type ='Printer' 
INTERSECT 
SELECT maker
FROM product p 
JOIN pc ON pc.model = p.model 
WHERE ram = (
  SELECT MIN(ram)
  FROM pc
) 
AND speed = (
  SELECT MAX(speed)
  FROM pc
  WHERE ram = (
    SELECT MIN(ram)
    FROM pc
  )
) 
``` 
### 26(2). Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). 
Вывести: одна общая средняя цена. 
``` 
WITH union_table as ( 
SELECT price
FROM product p 
JOIN pc ON pc.model=p.model 
WHERE maker='A' 
UNION ALL 
SELECT price
FROM product p 
JOIN laptop l ON l.model=p.model 
WHERE maker='A' 
) 
SELECT AVG(price)
FROM union_table 
``` 
### 27(2). Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. 
Вывести: maker, средний размер HD. 
``` 
SELECT DISTINCT maker, AVG(hd)
FROM product p 
JOIN pc ON pc.model = p.model 
WHERE type ='PC'
AND maker IN (
  SELECT maker
  FROM product
  WHERE type ='Printer'
) 
GROUP BY maker 
``` 
### 28(2). Используя таблицу Product, определить количество производителей, выпускающих по одной модели. 
``` 
SELECT COUNT(maker) qty
FROM product 
WHERE maker IN ( 
  SELECT maker
  FROM product  
  GROUP BY maker  
  HAVING COUNT(model)=1 
) 
``` 
### 35(2). В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра). 
Вывод: номер модели, тип модели.
``` 
SELECT model, type
FROM product 
WHERE model NOT LIKE '%[^0-9]%' OR model NOT LIKE '%[^A-Z]%' 
``` 
### 40(2). Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа. 
Вывести: maker, type
``` 
SELECT DISTINCT maker, type
FROM product 
WHERE maker IN ( 
  SELECT maker  
  FROM product  
  GROUP BY maker  
  HAVING COUNT(model)>1  AND COUNT(DISTINCT type)=1
) 
``` 

 
