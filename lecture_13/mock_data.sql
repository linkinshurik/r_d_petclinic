INSERT INTO Institutions (institution_name, institution_type, address) VALUES
('Greenwood Elementary', 'School', '123 Oak Street'),
('Happy Kids Kindergarten', 'Kindergarten', '456 Pine Avenue'),
('Lakeside High School', 'School', '789 Lake Drive');

INSERT INTO Classes (class_name, institution_id, direction) VALUES
('1A', 1, 'Language Studies'),
('Nursery', 2, 'Biology and Chemistry'),
('10B', 3, 'Mathematics');

INSERT INTO Children (first_name, last_name, birth_date, year_of_entry, age, institution_id, class_id) VALUES
('Emma', 'Johnson', '2017-04-12', 2023, 6, 1, 1),
('Liam', 'Smith', '2019-09-25', 2023, 4, 2, 2),
('Olivia', 'Brown', '2008-01-18', 2023, 15, 3, 3);

INSERT INTO Parents (first_name, last_name, child_id, tuition_fee) VALUES
('Sophia', 'Johnson', 1, 2500.00),
('William', 'Smith', 2, 1800.50),
('James', 'Brown', 3, 3200.75);