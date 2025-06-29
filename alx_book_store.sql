-- ALX Book Store Database Schema
-- File: alx_book_store.sql

-- CREATE THE DATABASE
CREATE DATABASE IF NOT EXISTS `main_book_store` 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR AUTHORS
-- --------------------------------------------------------
CREATE TABLE
  `authors` (
    `author_id` INT (11) NOT NULL,
    `author_name` VARCHAR(215) NOT NULL
  ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR BOOKS
-- --------------------------------------------------------
CREATE TABLE
  `books` (
    `book_id` INT (11) NOT NULL,
    `title` VARCHAR(130) NOT NULL,
    `author_id` INT (11) DEFAULT NULL,
    `price` DOUBLE NOT NULL,
    `publication_date` DATE DEFAULT NULL
  ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR CUSTOMERS
-- --------------------------------------------------------
CREATE TABLE
  `customers` (
    `customer_id` INT (11) NOT NULL,
    `customer_name` VARCHAR(215) NOT NULL,
    `email` VARCHAR(215) DEFAULT NULL,
    `address` TEXT DEFAULT NULL
  ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR ORDERS
-- --------------------------------------------------------
CREATE TABLE
  `orders` (
    `order_id` INT (11) NOT NULL,
    `customer_id` INT (11) DEFAULT NULL,
    `order_date` DATE NOT NULL
  ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR ORDER_DETAILS
-- --------------------------------------------------------
CREATE TABLE
  `order_details` (
    `orderdetailid` INT (11) NOT NULL,
    `order_id` INT (11) DEFAULT NULL,
    `book_id` INT (11) DEFAULT NULL,
    `quantity` DOUBLE NOT NULL
  ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- INDEXES
-- --------------------------------------------------------
ALTER TABLE `authors` ADD PRIMARY KEY (`author_id`);

ALTER TABLE `books` ADD PRIMARY KEY (`book_id`),
ADD KEY `author_id` (`author_id`);

ALTER TABLE `customers` ADD PRIMARY KEY (`customer_id`);

ALTER TABLE `orders` ADD PRIMARY KEY (`order_id`),
ADD KEY `customer_id` (`customer_id`);

ALTER TABLE `order_details` ADD PRIMARY KEY (`orderdetailid`),
ADD KEY `order_id` (`order_id`),
ADD KEY `book_id` (`book_id`);

-- --------------------------------------------------------
-- FOREIGN KEY CONSTRAINTS
-- --------------------------------------------------------
ALTER TABLE `books` ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

COMMIT;