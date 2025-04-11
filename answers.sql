-- Create roles for different access levels
CREATE ROLE bookstore_admin;
CREATE ROLE bookstore_manager;
CREATE ROLE bookstore_staff;
CREATE ROLE bookstore_customer;

-- Allow customers to modify their own data
GRANT SELECT, UPDATE ON customer TO bookstore_customer;
GRANT SELECT, INSERT, UPDATE, DELETE ON address TO bookstore_customer;
GRANT SELECT, INSERT, UPDATE, DELETE ON customer_address TO bookstore_customer;


-- Create admin user
CREATE USER admin_user identified by  'SecureAdmin123!';
GRANT bookstore_admin TO admin_user;

-- Create manager user
CREATE USER manager_user identified by 'ManagerPass456!';
GRANT bookstore_manager TO manager_user;

-- Create staff user
CREATE USER staff_user identified by 'StaffAccess789!';
GRANT bookstore_staff TO staff_user;

-- Create customer user
CREATE USER customer_user identified by 'CustomerPass123!';
GRANT bookstore_customer TO customer_user;
-- Create users
CREATE USER 'alice'@'localhost' IDENTIFIED BY 'AlicePass123!';
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'BobPass456!';
CREATE USER 'charlie'@'localhost' IDENTIFIED BY 'CharliePass789!';
CREATE USER 'diana'@'localhost' IDENTIFIED BY 'DianaPass321!';


-- Sales rep: access to order and customer info
GRANT SELECT, INSERT, UPDATE ON My_BookStore_DB.customer TO sales_rep;
GRANT SELECT, INSERT, UPDATE ON My_BookStore_DB.cust_order TO sales_rep;
GRANT SELECT, INSERT, UPDATE ON My_BookStore_DB.order_line TO sales_rep;


-- Customer support: view customers and orders
GRANT SELECT ON My_BookStore_DB.customer TO customer_support;
GRANT SELECT ON My_BookStore_DB.cust_order TO customer_support;
-- Insert data into book_language
INSERT INTO book_language (language_name, language_code) VALUES
('English', 'EN'),
('French', 'FR'),
('Spanish', 'ES'),
('German', 'DE'),
('Chinese', 'ZH');

-- Insert data into publisher
INSERT INTO publisher (publisher_name, publisher_email, publisher_phone, publisher_website) VALUES
('Penguin Random House', 'contact@penguinrandomhouse.com', '+1-212-782-9000', 'https://www.penguinrandomhouse.com'),
('HarperCollins', 'info@harpercollins.com', '+1-212-207-7000', 'https://www.harpercollins.com'),
('Macmillan Publishers', 'inquiries@macmillan.com', '+1-646-307-5151', 'https://us.macmillan.com'),
('Hachette Livre', 'contact@hachette-livre.fr', '+33-1-4392-3000', 'https://www.hachette.com'),
('Simon & Schuster', 'consumer@simonandschuster.com', '+1-212-698-7000', 'https://www.simonandschuster.com');

-- Insert data into author
INSERT INTO author (author_first_name, author_last_name, author_bio, author_email, date_of_birth) VALUES
('George', 'Orwell', 'English novelist, essayist, journalist and critic', 'info@georgeorwell.org', '1903-06-25'),
('J.K.', 'Rowling', 'British author best known for the Harry Potter series', 'jkrowling@jkrowling.com', '1965-07-31'),
('Stephen', 'King', 'American author of horror, supernatural fiction, suspense, and fantasy novels', 'contact@stephenking.com', '1947-09-21'),
('Agatha', 'Christie', 'English writer known for her detective novels', 'info@agathachristie.com', '1890-09-15'),
('Ernest', 'Hemingway', 'American journalist, novelist, and short-story writer', 'info@hemingwaybooks.com', '1899-07-21');

-- Insert data into book
INSERT INTO book (title, isbn, publication_date, price, description, publisher_id, language_id, page_count, stock_quantity) VALUES
('1984', '9780451524935', '1949-06-08', 9.99, 'A dystopian social science fiction novel', 1, 1, 328, 50),
('Animal Farm', '9780451526342', '1945-08-17', 7.99, 'A satirical allegorical novella', 1, 1, 112, 35),
('Harry Potter and the Philosopher''s Stone', '9780747532743', '1997-06-26', 12.99, 'First novel in the Harry Potter series', 2, 1, 223, 100),
('The Shining', '9780307743657', '1977-01-28', 14.99, 'A horror novel by Stephen King', 3, 1, 447, 25),
('Murder on the Orient Express', '9780062693662', '1934-01-01', 10.99, 'A detective novel by Agatha Christie', 4, 1, 256, 40),
('The Old Man and the Sea', '9780684801223', '1952-09-01', 11.99, 'A short novel by Ernest Hemingway', 5, 1, 127, 30);

-- Insert data into book_author
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 3), (5, 4), (6, 5);

-- Insert data into country
INSERT INTO country (country_name, country_code) VALUES
('United States', 'US'),
('United Kingdom', 'UK'),
('France', 'FR'),
('Germany', 'DE'),
('Canada', 'CA');

-- Insert data into address
INSERT INTO address (street_number, street_name, city, state_province, postal_code, country_id) VALUES
('123', 'Main Street', 'New York', 'NY', '10001', 1),
('456', 'Oak Avenue', 'London', NULL, 'SW1A 1AA', 2),
('789', 'Rue de Rivoli', 'Paris', NULL, '75001', 3),
('10', 'Friedrichstraße', 'Berlin', NULL, '10117', 4),
('100', 'Queen Street', 'Toronto', 'ON', 'M5H 2N2', 5);

-- Insert data into address_status
INSERT INTO address_status (status_name, description) VALUES
('Primary', 'Customer''s primary address'),
('Secondary', 'Customer''s secondary address'),
('Business', 'Business address'),
('Shipping', 'Shipping address only');

-- Insert data into customer
INSERT INTO customer (first_name, last_name, email, phone, password_hash) VALUES
('John', 'Doe', 'john.doe@example.com', '+1-212-555-1234', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRjQ5J3F8fQbJ8FqR2nYVtLdDDLEiG'),
('Jane', 'Smith', 'jane.smith@example.com', '+44-20-7946-0958', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRjQ5J3F8fQbJ8FqR2nYVtLdDDLEiG'),
('Pierre', 'Dupont', 'pierre.dupont@example.com', '+33-1-2345-6789', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRjQ5J3F8fQbJ8FqR2nYVtLdDDLEiG'),
('Anna', 'Müller', 'anna.mueller@example.com', '+49-30-1234567', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRjQ5J3F8fQbJ8FqR2nYVtLdDDLEiG'),
('David', 'Wilson', 'david.wilson@example.com', '+1-416-555-7890', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRjQ5J3F8fQbJ8FqR2nYVtLdDDLEiG');

-- Insert data into customer_address
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 1);

-- Insert data into order_status
INSERT INTO order_status (status_name, description) VALUES
('Pending', 'Order received but not processed'),
('Processing', 'Order is being prepared for shipment'),
('Shipped', 'Order has been shipped'),
('Delivered', 'Order has been delivered'),
('Cancelled', 'Order has been cancelled');

-- Insert data into shipping_method
INSERT INTO shipping_method (method_name, cost, estimated_days) VALUES
('Standard Shipping', 4.99, 5),
('Express Shipping', 9.99, 2),
('Overnight Shipping', 19.99, 1),
('International Shipping', 14.99, 7);

-- Insert data into cust_order
INSERT INTO cust_order (customer_id, shipping_address_id, billing_address_id, shipping_method_id, order_total, order_status_id) VALUES
(1, 1, 1, 1, 24.97, 4),
(2, 2, 2, 2, 38.97, 3),
(3, 3, 3, 4, 22.98, 2),
(4, 4, 4, 3, 14.99, 1),
(5, 5, 5, 1, 11.99, 4);

-- Insert data into order_line
INSERT INTO order_line (order_id, book_id, quantity, price_per_unit) VALUES
(1, 1, 1, 9.99),
(1, 2, 1, 7.99),
(1, 6, 1, 11.99),
(2, 3, 3, 12.99),
(3, 4, 1, 14.99),
(3, 5, 1, 10.99),
(4, 4, 1, 14.99),
(5, 6, 1, 11.99);

-- Insert data into order_history
INSERT INTO order_history (order_id, status_id, comments) VALUES
(1, 1, 'Order received'),
(1, 2, 'Processing order'),
(1, 3, 'Shipped via Standard Shipping'),
(1, 4, 'Delivered successfully'),
(2, 1, 'Order received'),
(2, 2, 'Processing order'),
(2, 3, 'Shipped via Express Shipping'),
(3, 1, 'Order received'),
(3, 2, 'Processing international order'),
(4, 1, 'Order received'),
(5, 1, 'Order received'),
(5, 2, 'Processing order'),
(5, 3, 'Shipped via Standard Shipping'),
(5, 4, 'Delivered successfully');

SELECT b.title, b.stock_quantity, p.publisher_name 
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id
ORDER BY b.stock_quantity DESC;

SELECT c.first_name, c.last_name, o.order_id, b.title, ol.quantity, o.order_total
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id
JOIN order_line ol ON o.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
ORDER BY o.order_date DESC;

SELECT a.author_first_name, a.author_last_name, SUM(ol.quantity) as total_sold, SUM(ol.line_total) as total_revenue
FROM author a
JOIN book_author ba ON a.author_id = ba.author_id
JOIN order_line ol ON ba.book_id = ol.book_id
GROUP BY a.author_id
ORDER BY total_revenue DESC;

SELECT b.title, SUM(ol.quantity) AS total_sold
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.title
ORDER BY total_sold DESC
LIMIT 5;

