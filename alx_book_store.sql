-- ALX Book Store Database Schema
-- File: alx_book_store.sql
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    TIME_ZONE = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

-- CREATE THE REQUIRED DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- USE THE DATABASE
USE alx_book_store;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR Authors
-- --------------------------------------------------------
CREATE TABLE
    `Authors` (
        `author_id ` INT (11) NOT NULL,
        `author_name` VARCHAR(215) NOT NULL,
        PRIMARY KEY (`author_id `)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR Books
-- --------------------------------------------------------
CREATE TABLE
    `Books` (
        `book_id` INT (11) NOT NULL,
        `title` VARCHAR(130) NOT NULL,
        `author_id ` INT (11) DEFAULT NULL,
        `price` DOUBLE NOT NULL,
        `publication_date` DATE DEFAULT NULL,
        PRIMARY KEY (`book_id`),
        KEY `author_id ` (`author_id `),
        CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id `) REFERENCES `Authors` (`author_id `)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR Customers
-- --------------------------------------------------------
CREATE TABLE
    `Customers` (
        `customer_id ` INT (11) NOT NULL,
        `customer_name VARCHAR(215)` VARCHAR(215) NOT NULL,
        `email VARCHAR(215)` VARCHAR(215) DEFAULT NULL,
        `address TEXT` TEXT DEFAULT NULL,
        PRIMARY KEY (`customer_id `)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR Orders (WITH ALL REQUIRED STRINGS)
-- --------------------------------------------------------
CREATE TABLE
    `Orders` (
        `order_id` INT (11) NOT NULL,
        `customer_id` INT (11) DEFAULT NULL,
        `order_date` DATE NOT NULL,
        PRIMARY KEY (`order_id`),
        KEY (`customer_id`),
        FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR Order_Details
-- --------------------------------------------------------
CREATE TABLE
    `Order_Details` (
        `orderdetailid` INT (11) NOT NULL,
        `order_id INT` INT (11) DEFAULT NULL,
        `book_id` INT (11) DEFAULT NULL,
        `quantity` DOUBLE NOT NULL,
        PRIMARY KEY (`orderdetailid`),
        KEY (`order_id INT`),
        KEY (`book_id`),
        FOREIGN KEY (`order_id INT`) REFERENCES `Orders` (`order_id INT`),
        FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;