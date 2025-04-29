-- 1. Отримайте інформацію про батьків і їхніх дітей разом із вартістю навчання

SELECT 
    p.parent_id,
    p.first_name AS parent_first_name,
    p.last_name AS parent_last_name,
    chld.child_id,
    chld.first_name AS child_first_name,
    chld.last_name AS child_last_name,
    p.tuition_fee
FROM 
    Parents p
JOIN 
    Children chld ON p.child_id = chld.child_id;