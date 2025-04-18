-- 1. Отримайте список всіх закладів з адресами та кількістю дітей, які навчаються в кожному закладі

SELECT 
    ins.institution_id,
    ins.institution_name,
    ins.address,
    COUNT(chld.child_id) AS children_count
FROM 
    Institutions ins
LEFT JOIN 
    Children chld ON ins.institution_id = chld.institution_id
GROUP BY 
    ins.institution_id, ins.institution_name, ins.address;