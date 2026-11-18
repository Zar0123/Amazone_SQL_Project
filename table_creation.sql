-- Amazone Project - Advanced SQL

-- ====================================
-- Creating Tables
-- ====================================


-- Category Table
CREATE TABLE category
(
category_id	INT PRIMARY KEY,
category_name VARCHAR(25)
);

-- customers table
CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
first_name	VARCHAR(25),
last_name	VARCHAR(25),
state VARCHAR(25),
address VARCHAR(20) DEFAULT ('xxxx')
);

-- sellers table
CREATE TABLE sellers
(
seller_id INT PRIMARY KEY,
seller_name	VARCHAR(25),
origin VARCHAR(25)
);

-- products table
CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),	
price FLOAT,
cogs FLOAT,
category_id INT,
CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- orders table
CREATE TABLE orders
(
order_id INT PRIMARY KEY,	
order_date DATE,
customer_id INT,
seller_id INT,
order_status VARCHAR(15),
CONSTRAINT customer_fk_order FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
CONSTRAINT seller_fk_order FOREIGN KEY(seller_id) REFERENCES sellers(seller_id)
);


-- order_items table
CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT,--fk
product_id INT,-- fk
quantity INT,
price_per_unit FLOAT,
CONSTRAINT order_fk_order_items FOREIGN KEY(order_id) REFERENCES orders(order_id),
CONSTRAINT product_fk_order_items FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- payment table
CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
order_id INT, -- FK
payment_date DATE,	
payment_status VARCHAR(20),
CONSTRAINT order_fk_payment FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

-- shipping table
CREATE TABLE shippings
(
shipping_id	INT PRIMARY KEY,
order_id INT,--FK
shipping_date DATE,
return_date DATE,
shipping_providers VARCHAR(15),
delivery_status VARCHAR(15),
CONSTRAINT order_fk_shippings FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

-- inventory table
CREATE TABLE inventory
(
inventory_id INT PRIMARY KEY,
product_id INT, -- FK
stock INT,
warehouse_id INT,
last_stock_date DATE,
CONSTRAINT product_fk_inventory FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- End of schemas
-- 54:03 stopped

