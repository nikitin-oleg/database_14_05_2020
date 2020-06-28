USE chop;

-- Вывести имена охранников, охраняемых ими объектов и список контактных лиц:

SELECT staff.name,  protected_objects.name as object, protected_objects.contact_person FROM chop.staff 
join chop.protected_objects
where staff.protected_objects_objects_id = protected_objects.objects_id;

-- Вывести список охраняемых объектов, организаций заказчиков и их руководителей:

SELECT protected_objects.name as object, customers.name, customers.head 
FROM chop.protected_objects
join chop.customers
on customers_customers_id = customers_id;

-- Показать количество объектов, имеющих или нет систему сигнализации:

SELECT COUNT(*) AS total, alarm_system FROM chop.protected_objects 
group by alarm_system;

-- Представление. Показывающее имя охранника и дату окончания его лицензии:

CREATE OR REPLACE VIEW licenses_of_guard(name, end_date) AS
SELECT staff.name AS name, lic.end_date
FROM staff
LEFT JOIN licenses_of_employees AS lic
ON lic.licenses_id = staff.Id;
SELECT * FROM licenses_of_guard;

-- Представление. Имя охранника и его должность:

CREATE OR REPLACE VIEW guard(name, guard) AS
SELECT staff.name,  staff_list.guard FROM chop.staff 
join chop.staff_list
where staff.staff_list_id = staff_list.id;
SELECT * FROM guard;

-- Процедура, проверяющая, закончилась ли лицензия организации:

delimiter //
DROP PROCEDURE IF EXISTS chek//
CREATE PROCEDURE chek()
BEGIN
        IF (TIMESTAMPDIFF(YEAR, (select information.end_licenses_date from information), CURDATE()) > 1) THEN
                SELECT 'В этом году заканчивается лицензия. Подготовте пакет документов для ее продления';
        ELSE
                SELECT 'Работайте дальше';
END IF;
END //
delimiter ;

-- Триггер, проверяющий, можно ли выдавать оружие охраннику. Проверяет, имеет ли он 6-ю категорию:

delimiter //
DROP TRIGGER IF EXISTS check_equipment//
CREATE TRIGGER check_equipment BEFORE INSERT ON staff_has_equipment
FOR EACH ROW
BEGIN
        IF(((select equipment_equipment_id from staff_has_equipment) > 7) AND (select category_of_guard_category_id from staff) < 4) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Категория у охранника недостаточная для выдачи оружия';
        END IF;
END //
delimiter ;


