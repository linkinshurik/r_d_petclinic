-- Виконайте анонімізацію даних дітей у таблиці Children, замінивши їхні імена та прізвища випадковими або узагальненими значеннями.

UPDATE Children
SET 
    first_name = 'Child',
    last_name = 'Anonymous';

-- Замініть імена та прізвища батьків на псевдоніми (наприклад, Parent1, Parent2 тощо), а електронну пошту або іншу контактну інформацію — на випадкові значення.

WITH parent_indexed AS (
  SELECT parent_id, ROW_NUMBER() OVER (ORDER BY parent_id) AS idx
  FROM Parents
)
UPDATE Parents
SET 
    first_name = 'Parent' || idx,
    last_name = 'Alias' || idx
FROM parent_indexed
WHERE Parents.parent_id = parent_indexed.parent_id;

-- Для забезпечення конфіденційності замініть реальні назви закладів на умовні, наприклад, "Institution1", "Institution2" тощо.

WITH inst_indexed AS (
  SELECT institution_id, ROW_NUMBER() OVER (ORDER BY institution_id) AS idx
  FROM Institutions
)
UPDATE Institutions
SET 
    institution_name = 'Institution' || idx
FROM inst_indexed
WHERE Institutions.institution_id = inst_indexed.institution_id;

-- Для збереження конфіденційності змініть вартість навчання (tuition_fee) на усереднені або випадкові значення в межах розумного діапазону.

UPDATE Parents
SET tuition_fee = ROUND(1000 + RANDOM() * 5000);

-- Виконайте запит, щоб переглянути результати анонімізації.

SELECT 
    chld.first_name AS child_first_name,
    chld.last_name AS child_last_name,
    p.first_name AS parent_first_name,
    p.last_name AS parent_last_name,
    ins.institution_name,
    p.tuition_fee
FROM 
    Children chld
JOIN Parents p ON chld.child_id = p.child_id
JOIN Institutions ins ON chld.institution_id = ins.institution_id
LIMIT 10;