-- DATA PREPARATION - NORDSTROM PRODUCTS
-- MUHAMMAD ARIENAL HAQ - PORTFOLIO

-- Dataset Source:
-- https://www.kaggle.com/datasets/polartech/nordstrom-dataset


-- Create and use nordstrom database
CREATE DATABASE nordstrom;
USE nordstrom;


-- Create boots table
CREATE TABLE boots (
	product_name VARCHAR(255),
    department VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    sku VARCHAR(20),
    brand VARCHAR(50),
    price_current_usd VARCHAR(10),
    price_retail_usd VARCHAR(10),
    review_rating VARCHAR(10),
	review_count VARCHAR(10),
    color VARCHAR(10),
    run_date VARCHAR(50)
);


-- Import data from CSV file use Table Data Import Wizard


-- Select all boots table
SELECT * FROM boots;


-- Delete unused column
ALTER TABLE boots 
DROP COLUMN run_date;


-- Add primary key in table
ALTER TABLE boots 
ADD boots_id INT PRIMARY KEY AUTO_INCREMENT;


-- Re-order column position
ALTER TABLE boots 
CHANGE COLUMN id id INT NOT NULL FIRST;

ALTER TABLE boots 
CHANGE COLUMN color color VARCHAR(10) NOT NULL AFTER brand;


-- Find and delete duplicate item
SELECT * FROM boots 
GROUP BY sku 
HAVING COUNT(*) > 1;

SELECT * FROM boots 
WHERE sku='5228770';

SET SQL_SAFE_UPDATES = 0;
DELETE t1 
FROM boots t1
INNER JOIN boots t2 
WHERE 
	t1.id < t2.id AND 
	t1.sku = t2.sku AND
    t1.price_current_usd = t2.price_current_usd AND
    t1.price_retail_usd = t2.price_retail_usd;
SET SQL_SAFE_UPDATES = 1;


-- Find null value in table
SELECT * FROM boots 
WHERE ISNULL(product_name) OR ISNULL(department);


-- Create table department
CREATE TABLE department (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20)
);


-- Insert department.name column use value in boots.department
INSERT INTO department (name) 
SELECT DISTINCT department FROM boots;


-- Add foreign key in boots table
ALTER TABLE boots 
ADD COLUMN department_id INT, 
ADD FOREIGN KEY (department_id) 
REFERENCES department(department_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from boots.department with department.name
SET SQL_SAFE_UPDATES = 0;
UPDATE boots 
JOIN department
SET boots.department_id = department.department_id
WHERE boots.department = department.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column department on boots
ALTER TABLE boots 
DROP COLUMN department;


-- Create table category
CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20)
);


-- Insert category.name column use value in boots.category
INSERT INTO category (name) 
SELECT DISTINCT category FROM boots;


-- Add foreign key in boots table
ALTER TABLE boots 
ADD COLUMN category_id INT, 
ADD FOREIGN KEY (category_id) 
REFERENCES category(category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from boots.category with category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE boots 
JOIN category
SET boots.category_id = category.category_id
WHERE boots.category = category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column category on boots
ALTER TABLE boots 
DROP COLUMN category;


-- Create table sub_category
CREATE TABLE sub_category (
  sub_category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20)
);


-- Insert sub_category.name column use value in boots.sub_category
INSERT INTO sub_category (name) 
SELECT DISTINCT sub_category FROM boots;


-- Add foreign key in boots table
ALTER TABLE boots 
ADD COLUMN sub_category_id INT, 
ADD FOREIGN KEY (sub_category_id) 
REFERENCES sub_category(sub_category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from boots.sub_category with sub_category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE boots 
JOIN sub_category
SET boots.sub_category_id = sub_category.sub_category_id
WHERE boots.sub_category = sub_category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column sub_category on boots
ALTER TABLE boots 
DROP COLUMN sub_category;


-- Create table boots_brand
CREATE TABLE boots_brand (
  boots_brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);


-- Insert boots_brand.name column use value in boots.brand
INSERT INTO boots_brand (name) 
SELECT DISTINCT brand FROM boots;


-- Add foreign key in boots table
ALTER TABLE boots 
ADD COLUMN boots_brand_id INT, 
ADD FOREIGN KEY (boots_brand_id) 
REFERENCES boots_brand(boots_brand_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from boots.brand with boots_brand.name
SET SQL_SAFE_UPDATES = 0;
UPDATE boots 
JOIN boots_brand
SET boots.boots_brand_id = boots_brand.boots_brand_id
WHERE boots.brand = boots_brand.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column brand on boots
ALTER TABLE boots 
DROP COLUMN brand;


-- Create table boots_color
CREATE TABLE boots_color (
  boots_color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(10)
);


-- Insert boots_color.name column use value in boots.color
INSERT INTO boots_color (name) 
SELECT DISTINCT color FROM boots;


-- Add foreign key in boots table
ALTER TABLE boots 
ADD COLUMN boots_color_id INT, 
ADD FOREIGN KEY (boots_color_id) 
REFERENCES boots_color(boots_color_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from boots.brand with boots_color.name
SET SQL_SAFE_UPDATES = 0;
UPDATE boots 
JOIN boots_color
SET boots.boots_color_id = boots_color.boots_color_id
WHERE boots.color = boots_color.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column color on boots
ALTER TABLE boots DROP COLUMN color;


-- Change data type in several column
ALTER TABLE boots MODIFY sku INT;

ALTER TABLE boots MODIFY price_current_usd DECIMAL(18, 2);

ALTER TABLE boots MODIFY price_retail_usd DECIMAL(18, 2);

ALTER TABLE boots MODIFY review_rating DECIMAL(18, 1);

ALTER TABLE boots MODIFY review_count INT;


-- Check all boots table
SELECT * FROM boots;


-- Create table flats
CREATE TABLE flats (
	product_name VARCHAR(255),
    department VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    sku VARCHAR(20),
    brand VARCHAR(50),
    price_current_usd VARCHAR(10),
    price_retail_usd VARCHAR(10),
    review_rating VARCHAR(10),
	review_count VARCHAR(10),
    color VARCHAR(10),
    run_date VARCHAR(50)
);


-- Import data from CSV file use Table Data Import Wizard


-- Select all flats table
SELECT * FROM flats;


-- Delete unused column
ALTER TABLE flats 
DROP COLUMN run_date;


-- Add primary key in table
ALTER TABLE flats 
ADD flats_id INT PRIMARY KEY AUTO_INCREMENT;


-- Re-order column position
ALTER TABLE flats 
CHANGE COLUMN id id INT NOT NULL FIRST;

ALTER TABLE flats 
CHANGE COLUMN color color VARCHAR(10) NOT NULL AFTER brand;


-- Find and delete duplicate item
SELECT * FROM flats 
GROUP BY sku 
HAVING COUNT(*) > 1;

SELECT * FROM flats 
WHERE sku='3194852';

SET SQL_SAFE_UPDATES = 0;
DELETE t1 
FROM flats t1
INNER JOIN flats t2 
WHERE 
	t1.id < t2.id AND 
    t1.sku = t2.sku AND
    t1.price_current_usd = t2.price_current_usd AND
    t1.price_retail_usd = t2.price_retail_usd;
SET SQL_SAFE_UPDATES = 1;


-- Find null value in table
SELECT * FROM flats 
WHERE ISNULL(product_name) OR ISNULL(department);


-- Insert department.name column use value in flats.department
INSERT INTO department (name) 
SELECT DISTINCT department FROM flats;


-- Add foreign key in flats table
ALTER TABLE flats 
ADD COLUMN department_id INT, 
ADD FOREIGN KEY (department_id) 
REFERENCES department(department_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from flats.department with department.name
SET SQL_SAFE_UPDATES = 0;
UPDATE flats 
JOIN department
SET flats.department_id = department.department_id
WHERE flats.department = department.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column department on flats
ALTER TABLE flats 
DROP COLUMN department;


-- Add foreign key in flats table 
ALTER TABLE flats 
ADD COLUMN category_id INT, 
ADD FOREIGN KEY (category_id) 
REFERENCES category(category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from flats.catgeory with category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE flats 
JOIN category
SET flats.category_id = category.category_id
WHERE flats.category = category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column category on flats
ALTER TABLE flats 
DROP COLUMN category;


-- Insert sub_category.name column use value in flats.sub_category
INSERT INTO sub_category (name) 
SELECT DISTINCT sub_category FROM flats;


-- Add foreign key in flats table
ALTER TABLE flats 
ADD COLUMN sub_category_id INT, 
ADD FOREIGN KEY (sub_category_id) 
REFERENCES sub_category(sub_category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from flats.sub_catgeory with sub_category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE flats 
JOIN sub_category
SET flats.sub_category_id = sub_category.sub_category_id
WHERE flats.sub_category = sub_category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column sub_category on flats
ALTER TABLE flats 
DROP COLUMN sub_category;


-- Create table flats_brand
CREATE TABLE flats_brand (
  flats_brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);


-- Insert flats_brand.name column use value in flats.brand
INSERT INTO flats_brand (name) 
SELECT DISTINCT brand FROM flats;


-- Add foreign key in flats table
ALTER TABLE flats 
ADD COLUMN flats_brand_id INT, 
ADD FOREIGN KEY (flats_brand_id) 
REFERENCES flats_brand(flats_brand_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from flats.brand with flats_brand.name
SET SQL_SAFE_UPDATES = 0;
UPDATE flats 
JOIN flats_brand
SET flats.flats_brand_id = flats_brand.flats_brand_id
WHERE flats.brand = flats_brand.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column brand on flats
ALTER TABLE flats 
DROP COLUMN brand;


-- Create table flats_color
CREATE TABLE flats_color (
  flats_color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(10)
);


-- Insert flats_color.name column use value in flats.color
INSERT INTO flats_color (name) 
SELECT DISTINCT color FROM flats;


-- Add foreign key in flats table
ALTER TABLE flats 
ADD COLUMN flats_color_id INT, 
ADD FOREIGN KEY (flats_color_id) 
REFERENCES flats_color(flats_color_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from flats.color with flats_color.name
SET SQL_SAFE_UPDATES = 0;
UPDATE flats 
JOIN flats_color
SET flats.flats_color_id = flats_color.flats_color_id
WHERE flats.color = flats_color.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column color on flats
ALTER TABLE flats DROP COLUMN color;


-- Change data type in several column
ALTER TABLE flats MODIFY sku INT;

ALTER TABLE flats MODIFY price_current_usd DECIMAL(18, 2);

ALTER TABLE flats MODIFY price_retail_usd DECIMAL(18, 2);

ALTER TABLE flats MODIFY review_rating DECIMAL(18, 1);

ALTER TABLE flats MODIFY review_count INT;


-- Check all flats table
SELECT * FROM flats;


-- Create table skirts
CREATE TABLE skirts (
	product_name VARCHAR(255),
    department VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    sku VARCHAR(20),
    brand VARCHAR(50),
    price_current_usd VARCHAR(10),
    price_retail_usd VARCHAR(10),
    review_rating VARCHAR(10),
	review_count VARCHAR(10),
    color VARCHAR(10),
    run_date VARCHAR(50)
);


-- Import data from CSV file use Table Data Import Wizard


-- Select all skirts table
SELECT * FROM skirts_brand;


-- Delete unused column
ALTER TABLE skirts 
DROP COLUMN run_date;


-- Add primary key in table
ALTER TABLE skirts 
ADD skirts_id INT PRIMARY KEY AUTO_INCREMENT;


-- Re-order column position
ALTER TABLE skirts 
CHANGE COLUMN id id INT NOT NULL FIRST;

ALTER TABLE skirts 
CHANGE COLUMN color color VARCHAR(10) NOT NULL AFTER brand;


-- Find and delete duplicate item
SELECT * FROM skirts 
GROUP BY sku 
HAVING COUNT(*) > 1;

SELECT * FROM skirts 
WHERE sku='5970501';

SET SQL_SAFE_UPDATES = 0;
DELETE t1 
FROM skirts t1
INNER JOIN skirts t2 
WHERE 
    t1.id < t2.id AND 
    t1.sku = t2.sku AND
    t1.price_current_usd = t2.price_current_usd AND
    t1.price_retail_usd = t2.price_retail_usd;
SET SQL_SAFE_UPDATES = 1;


-- Find null value in table
SELECT * FROM skirts 
WHERE ISNULL(product_name) OR ISNULL(brand);


-- Add foreign key in skirts table
ALTER TABLE skirts 
ADD COLUMN department_id INT, 
ADD FOREIGN KEY (department_id) 
REFERENCES department(department_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from skirts.department with department.name
SET SQL_SAFE_UPDATES = 0;
UPDATE skirts 
JOIN department
SET skirts.department_id = department.department_id
WHERE skirts.department = department.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column department on skirts
ALTER TABLE skirts 
DROP COLUMN department;


-- Insert catgeory.name column use value in skirts.category
INSERT INTO category (name) 
SELECT DISTINCT category FROM skirts;


-- Add foreign key in flats table
ALTER TABLE skirts 
ADD COLUMN category_id INT, 
ADD FOREIGN KEY (category_id) 
REFERENCES category(category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from skirts.category with category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE skirts 
JOIN category
SET skirts.category_id = category.category_id
WHERE skirts.category = category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column category on skirts
ALTER TABLE skirts 
DROP COLUMN category;


-- Insert sub_catgeory.name column use value in skirts.sub_category
INSERT INTO sub_category (name) 
SELECT DISTINCT sub_category FROM skirts;


-- Add foreign key in skirts table
ALTER TABLE skirts 
ADD COLUMN sub_category_id INT, 
ADD FOREIGN KEY (sub_category_id) 
REFERENCES sub_category(sub_category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from skirts.sub_category with sub_category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE skirts 
JOIN sub_category
SET skirts.sub_category_id = sub_category.sub_category_id
WHERE skirts.sub_category = sub_category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column sub_category on skirts
ALTER TABLE skirts 
DROP COLUMN sub_category;


-- Create table skirts_brand
CREATE TABLE skirts_brand (
  skirts_brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);


-- Insert skirts_brand.name column use value in skirts.brand
INSERT INTO skirts_brand (name) 
SELECT DISTINCT brand FROM skirts;


-- Add foreign key in skirts table
ALTER TABLE skirts 
ADD COLUMN skirts_brand_id INT, 
ADD FOREIGN KEY (skirts_brand_id) 
REFERENCES skirts_brand(skirts_brand_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from skirts.brand with skirts_brand.name
SET SQL_SAFE_UPDATES = 0;
UPDATE skirts 
JOIN skirts_brand
SET skirts.skirts_brand_id = skirts_brand.skirts_brand_id
WHERE skirts.brand = skirts_brand.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column brand on skirts
ALTER TABLE skirts 
DROP COLUMN brand;


-- Create table skirts_color
CREATE TABLE skirts_color (
  skirts_color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(10)
);


-- Insert skirts_color.name column use value in skirts.color
INSERT INTO skirts_color (name) 
SELECT DISTINCT color FROM skirts;


-- Add foreign key in skirts table
ALTER TABLE skirts 
ADD COLUMN skirts_color_id INT, 
ADD FOREIGN KEY (skirts_color_id) 
REFERENCES skirts_color(skirts_color_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from skirts.color with skirts_color.name
SET SQL_SAFE_UPDATES = 0;
UPDATE skirts 
JOIN skirts_color
SET skirts.skirts_color_id = skirts_color.skirts_color_id
WHERE skirts.color = skirts_color.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column color on skirts
ALTER TABLE skirts 
DROP COLUMN color;


-- Change data type in several column
ALTER TABLE skirts MODIFY sku INT;

ALTER TABLE skirts MODIFY price_current_usd DECIMAL(18, 2);

ALTER TABLE skirts MODIFY price_retail_usd DECIMAL(18, 2);

ALTER TABLE skirts MODIFY review_rating DECIMAL(18, 1);

ALTER TABLE skirts MODIFY review_count INT;


-- Check all skirts table
SELECT * FROM skirts;


-- Create table sweaters
CREATE TABLE sweaters (
	product_name VARCHAR(255),
    department VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    sku VARCHAR(20),
    brand VARCHAR(50),
    price_current_usd VARCHAR(10),
    price_retail_usd VARCHAR(10),
    review_rating VARCHAR(10),
	review_count VARCHAR(10),
    color VARCHAR(10),
    run_date VARCHAR(50)
);


-- Import data from CSV file use Table Data Import Wizard


-- Select all sweaters table
SELECT * FROM sweaters_brand;


-- Delete unused column
ALTER TABLE sweaters 
DROP COLUMN run_date;


-- Add primary key in table
ALTER TABLE sweaters 
ADD sweaters_id INT PRIMARY KEY AUTO_INCREMENT;


-- Re-order column position
ALTER TABLE sweaters 
CHANGE COLUMN id id INT NOT NULL FIRST;

ALTER TABLE sweaters 
CHANGE COLUMN color color VARCHAR(10) NOT NULL AFTER brand;


-- Find and delete duplicate item
SELECT * FROM sweaters 
GROUP BY sku 
HAVING COUNT(*) > 1;

SELECT * FROM sweaters 
WHERE sku='4883427';

SET SQL_SAFE_UPDATES = 0;
DELETE t1 FROM sweaters t1
INNER JOIN sweaters t2 
WHERE 
    t1.id < t2.id AND 
    t1.sku = t2.sku AND
    t1.price_current_usd = t2.price_current_usd AND
    t1.price_retail_usd = t2.price_retail_usd;
SET SQL_SAFE_UPDATES = 1;


-- Find null value in table
SELECT * FROM sweaters 
WHERE ISNULL(product_name) OR ISNULL(department);


-- Add foreign key in sweaters table
ALTER TABLE sweaters 
ADD COLUMN department_id INT, 
ADD FOREIGN KEY (department_id) 
REFERENCES department(department_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from sweaters.department with department.name
SET SQL_SAFE_UPDATES = 0;
UPDATE sweaters 
JOIN department
SET sweaters.department_id = department.department_id
WHERE sweaters.department = department.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column department on sweaters
ALTER TABLE sweaters 
DROP COLUMN department;


-- Add foreign key in sweaters table
ALTER TABLE sweaters 
ADD COLUMN category_id INT, 
ADD FOREIGN KEY (category_id) 
REFERENCES category(category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from sweaters.category with category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE sweaters JOIN category
SET sweaters.category_id = category.category_id
WHERE sweaters.category = category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column category on sweaters
ALTER TABLE sweaters 
DROP COLUMN category;


-- Insert sub_category.name column use value in sweaters.sub_category
INSERT INTO sub_category (name) 
SELECT DISTINCT sub_category FROM sweaters;


-- Add foreign key in sweaters table
ALTER TABLE sweaters 
ADD COLUMN sub_category_id INT, 
ADD FOREIGN KEY (sub_category_id) 
REFERENCES sub_category(sub_category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from sweaters.sub_category with sub_category.name
SET SQL_SAFE_UPDATES = 0;
UPDATE sweaters 
JOIN sub_category
SET sweaters.sub_category_id = sub_category.sub_category_id
WHERE sweaters.sub_category = sub_category.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column sub_category on sweaters
ALTER TABLE sweaters 
DROP COLUMN sub_category;


-- Create table sweaters_brand
CREATE TABLE sweaters_brand (
  sweaters_brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);


-- Insert sweaters_brand.name column use value in sweaters.brand
INSERT INTO sweaters_brand (name) 
SELECT DISTINCT brand FROM sweaters;


-- Add foreign key in sweaters table
ALTER TABLE sweaters 
ADD COLUMN sweaters_brand_id INT, 
ADD FOREIGN KEY (sweaters_brand_id) 
REFERENCES sweaters_brand(sweaters_brand_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from sweaters.brand with sweaters_brand.name
SET SQL_SAFE_UPDATES = 0;
UPDATE sweaters 
JOIN sweaters_brand
SET sweaters.sweaters_brand_id = sweaters_brand.sweaters_brand_id
WHERE sweaters.brand = sweaters_brand.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column brand on sweaters
ALTER TABLE sweaters 
DROP COLUMN brand;


-- Create table sweaters_color
CREATE TABLE sweaters_color (
  sweaters_color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(10)
);


-- Insert sweaters_color.name column use value in sweaters.color
INSERT INTO sweaters_color (name) 
SELECT DISTINCT color FROM sweaters;


-- Add foreign key in sweaters table
ALTER TABLE sweaters 
ADD COLUMN sweaters_color_id INT, 
ADD FOREIGN KEY (sweaters_color_id) 
REFERENCES sweaters_color(sweaters_color_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- Join value from sweaters.color with sweaters_color.name
SET SQL_SAFE_UPDATES = 0;
UPDATE sweaters 
JOIN sweaters_color
SET sweaters.sweaters_color_id = sweaters_color.sweaters_color_id
WHERE sweaters.color = sweaters_color.name;
SET SQL_SAFE_UPDATES = 1;


-- Delete column color on sweaters
ALTER TABLE sweaters 
DROP COLUMN color;


-- Change data type in several column
ALTER TABLE sweaters MODIFY sku INT;

ALTER TABLE sweaters MODIFY price_current_usd DECIMAL(18, 2);

ALTER TABLE sweaters MODIFY price_retail_usd DECIMAL(18, 2);

ALTER TABLE sweaters MODIFY review_rating DECIMAL(18, 1);

ALTER TABLE sweaters MODIFY review_count INT;


-- Check all sweaters table
SELECT * FROM sweaters;


-- Re-order primary key in several table
SET @count = 0;
UPDATE category SET category.category_id = @count:= @count + 1;
ALTER TABLE category AUTO_INCREMENT = 1;

SET @count = 0;
UPDATE boots SET boots.id = @count:= @count + 1;
ALTER TABLE boots AUTO_INCREMENT = 1;

SET @count = 0;
UPDATE flats SET flats.id = @count:= @count + 1;
ALTER TABLE flats AUTO_INCREMENT = 1;

SET @count = 0;
UPDATE skirts SET skirts.id = @count:= @count + 1;
ALTER TABLE skirts AUTO_INCREMENT = 1;

SET @count = 0;
UPDATE sweaters SET sweaters.id = @count:= @count + 1;
ALTER TABLE sweaters AUTO_INCREMENT = 1;
