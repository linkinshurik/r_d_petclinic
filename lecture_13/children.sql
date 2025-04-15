CREATE TABLE Children (
    child_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    year_of_entry INT NOT NULL,
    age INT NOT NULL,
    institution_id INT NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);