CREATE DATABASE bioinformatics_database;
USE bioinformatics_database;
CREATE TABLE genes (
    gene_id INT PRIMARY KEY,
    gene_name VARCHAR(255),
    chromosome_location VARCHAR(50)
    -- Add other attributes as needed
);

-- Create Tissue table
CREATE TABLE tissues (
    tissue_id INT PRIMARY KEY,
    tissue_type VARCHAR(255),
    collection_date DATE
    -- Add other attributes as needed
);

-- Create Disease table
CREATE TABLE diseases (
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(255),
    diagnosis_method VARCHAR(100)
    -- Add other attributes as needed
);

-- Create Sample table
CREATE TABLE samples (
    sample_id INT PRIMARY KEY,
    sample_type VARCHAR(255),
    quantity INT
    -- Add other attributes as needed
);

-- Create Patient table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    gender VARCHAR(10)
    -- Add other attributes as needed
);

-- Create Gene_Tissue relationship table (Many-to-Many)
CREATE TABLE gene_tissue (
    gene_id INT,
    tissue_id INT,
    PRIMARY KEY (gene_id, tissue_id),
    FOREIGN KEY (gene_id) REFERENCES genes(gene_id),
    FOREIGN KEY (tissue_id) REFERENCES tissues(tissue_id)
);

-- Create Tissue_Sample relationship table (One-to-Many)
CREATE TABLE tissue_samples (
    tissue_id INT,
    sample_id INT,
    PRIMARY KEY (tissue_id, sample_id),
    FOREIGN KEY (tissue_id) REFERENCES tissues(tissue_id),
    FOREIGN KEY (sample_id) REFERENCES samples(sample_id)
);

-- Create Sample_Patient relationship table (Many-to-One)
CREATE TABLE sample_patients (
    sample_id INT,
    patient_id INT,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES samples(sample_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create Patient_Disease relationship table (One-to-Many)
CREATE TABLE patient_diseases (
    patient_id INT,
    disease_id INT,
    PRIMARY KEY (patient_id, disease_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);