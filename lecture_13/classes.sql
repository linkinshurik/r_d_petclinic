CREATE TABLE Classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    institution_id INT NOT NULL,
    direction VARCHAR(50) NOT NULL CHECK (direction IN ('Mathematics', 'Biology and Chemistry', 'Language Studies')),
    FOREIGN KEY (institution_id) REFERENCES Institutions(institution_id)
);