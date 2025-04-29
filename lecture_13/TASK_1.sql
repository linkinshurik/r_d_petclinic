-- Отримайте список всіх дітей разом із закладом, в якому вони навчаються, та напрямом навчання в класі

SELECT 
    chld.child_id,
    chld.first_name,
    chld.last_name,
    inst.institution_name,
    cls.direction
FROM 
    Children chld
JOIN 
    Institutions inst ON chld.institution_id = inst.institution_id
JOIN 
    Classes cls ON chld.class_id = cls.class_id;