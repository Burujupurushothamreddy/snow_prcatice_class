create or replace  database scd_type2_db;

CREATE OR REPLACE TABLE staging_table (
    id INT,
    name STRING,
    load_date TIMESTAMP
);

select * from staging_table;

CREATE OR REPLACE TABLE dynamic_table (
    id INT,
    name STRING,
    valid_from TIMESTAMP,
    valid_to TIMESTAMP,
    is_active BOOLEAN
);

 select * from dynamic_table;

 INSERT INTO staging_table (id, name, load_date)
VALUES (1, 'John Doe', CURRENT_TIMESTAMP);

INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
SELECT id, name, load_date, NULL, TRUE
FROM staging_table;

-- Mark the old record as inactive
UPDATE dynamic_table
SET valid_to = CURRENT_TIMESTAMP, is_active = FALSE
WHERE id = 1 AND is_active = TRUE;

-- Insert the new record
INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
VALUES (1, 'John Smith', CURRENT_TIMESTAMP, NULL, TRUE);

CREATE OR REPLACE DYNAMIC TABLE dynamic_table AS
SELECT id, name, load_date AS valid_from, NULL AS valid_to, TRUE AS is_active
FROM staging_table
WHERE NOT EXISTS (
    SELECT 1
    FROM dynamic_table
    WHERE dynamic_table.id = staging_table.id
    AND dynamic_table.is_active = TRUE
);

INSERT INTO staging_table (id, name, load_date)
VALUES (2, 'Jane Doe', CURRENT_TIMESTAMP);

INSERT INTO staging_table (id, name, load_date)
VALUES (3, 'Alice Smith', CURRENT_TIMESTAMP);

INSERT INTO staging_table (id, name, load_date)
VALUES (4, 'Bob Johnson', CURRENT_TIMESTAMP);

INSERT INTO staging_table (id, name, load_date)
VALUES (5, 'Charlie Brown', CURRENT_TIMESTAMP);

INSERT INTO staging_table (id, name, load_date)
VALUES (6, 'Diana Prince', CURRENT_TIMESTAMP);

-- Mark the old record as inactive
UPDATE dynamic_table
SET valid_to = CURRENT_TIMESTAMP, is_active = FALSE
WHERE id = 2 AND is_active = TRUE;

-- Insert the new record
INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
VALUES (2, 'Jane Smith', CURRENT_TIMESTAMP, NULL, TRUE);

-- Mark the old record as inactive
UPDATE dynamic_table
SET valid_to = CURRENT_TIMESTAMP, is_active = FALSE
WHERE id = 3 AND is_active = TRUE;

-- Insert the new record
INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
VALUES (3, 'Alice Johnson', CURRENT_TIMESTAMP, NULL, TRUE);

-- Mark the old record as inactive
UPDATE dynamic_table
SET valid_to = CURRENT_TIMESTAMP, is_active = FALSE
WHERE id = 4 AND is_active = TRUE;

-- Insert the new record
INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
VALUES (4, 'Bob Smith', CURRENT_TIMESTAMP, NULL, TRUE);

-- Mark the old record as inactive
UPDATE dynamic_table
SET valid_to = CURRENT_TIMESTAMP, is_active = FALSE
WHERE id = 5 AND is_active = TRUE;

-- Insert the new record
INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
VALUES (5, 'Charlie Johnson', CURRENT_TIMESTAMP, NULL, TRUE);

-- Mark the old record as inactive
UPDATE dynamic_table
SET valid_to = CURRENT_TIMESTAMP, is_active = FALSE
WHERE id = 6 AND is_active = TRUE;

-- Insert the new record
INSERT INTO dynamic_table (id, name, valid_from, valid_to, is_active)
VALUES (6, 'Diana Wayne', CURRENT_TIMESTAMP, NULL, TRUE);

___________________________________________________________________
----permanent---

CREATE DATABASE My_Database;

CREATE SCHEMA perm_schema;

CREATE TABLE MY_DATABASE.perm_schema.ABC (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Email NVARCHAR(100)
);

INSERT INTO MY_DATABASE.perm_schema.ABC (ID, Name, Age, Email)
VALUES 
(1, 'John Doe', 30, 'john.doe@example.com'),
(2, 'Jane Smith', 25, 'jane.smith@example.com'),
(3, 'Sam Brown', 28, 'sam.brown@example.com');

select * from MY_DATABASE.perm_schema.ABC;

------transient-----------

CREATE  Transient Database Transient_db ;

CREATE  Transient Schema csk_trans;

CREATE TABLE TRANSIENT_DB.CSK_TRANS.xyz  (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Email NVARCHAR(100)
);

INSERT INTO TRANSIENT_DB.CSK_TRANS.xyz (ID, Name, Age, Email)
VALUES 
(1, 'Alice Johnson', 29, 'alice.johnson@example.com'),
(2, 'Bob Lee', 34, 'bob.lee@example.com'),
(3, 'Charlie Kim', 27, 'charlie.kim@example.com');

select * from TRANSIENT_DB.CSK_TRANS.xyz;

---------temporaray-----------

CREATE temporary TABLE msd (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Email NVARCHAR(100)
);

INSERT INTO msd (ID, Name, Age, Email)
VALUES 
(1, 'Alice Johnson', 29, 'alice.johnson@example.com'),
(2, 'Bob Lee', 34, 'bob.lee@example.com'),
(3, 'Charlie Kim', 27, 'charlie.kim@example.com');

select * from msd;

------task----
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);

select * from customer;

CREATE transient TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);


CREATE temporary TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);

select * from Customer;


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES (3, 'Michael', 'Johnson', 'michael.johnson@example.com', '345-678-9012');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES (4, 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES (5, 'David', 'Brown', 'david.brown@example.com', '567-890-1234');

1) we can create permanent, transient databases and schemas we can not create temoparary      schema and database.

2) we can create permanent table name with same name as temporary table.

3) we can not create permanent table name with same name as transient table. 

4) we have 2 types (temp/permanent )  with same name
 suppose if i insert data which table its going to store ?

 ANS: temporary