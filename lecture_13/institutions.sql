CREATE TABLE Institutions (
    institution_id SERIAL PRIMARY KEY,
    institution_name VARCHAR(255) NOT NULL,
    institution_type VARCHAR(20) NOT NULL CHECK (institution_type IN ('School', 'Kindergarten')),
    address VARCHAR(255) NOT NULL
);