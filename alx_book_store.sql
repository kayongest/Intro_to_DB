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

-- CREATE THE REQUIRED DATABASE (EXACT STRING AS REQUIRED)
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- USE THE DATABASE
USE alx_book_store;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR AUTHORS
-- --------------------------------------------------------
CREATE TABLE
    `authors` (
        `author_id` INT (11) NOT NULL,
        `author_name` VARCHAR(215) NOT NULL,
        PRIMARY KEY (`author_id`)
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
        `publication_date` DATE DEFAULT NULL,
        PRIMARY KEY (`book_id`),
        KEY `author_id` (`author_id`),
        CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR CUSTOMERS
-- --------------------------------------------------------
CREATE TABLE
    `customers` (
        `customer_id` INT (11) NOT NULL,
        `customer_name` VARCHAR(215) NOT NULL,
        `email` VARCHAR(215) DEFAULT NULL,
        `address` TEXT DEFAULT NULL,
        PRIMARY KEY (`customer_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR ORDERS
-- --------------------------------------------------------
CREATE TABLE
    `orders` (
        `order_id` INT (11) NOT NULL,
        `customer_id` INT (11) DEFAULT NULL,
        `order_date` DATE NOT NULL,
        PRIMARY KEY (`order_id`),
        KEY `customer_id` (`customer_id`),
        CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
-- TABLE STRUCTURE FOR ORDER_DETAILS
-- --------------------------------------------------------
CREATE TABLE
    `order_details` (
        `orderdetailid` INT (11) NOT NULL,
        `order_id` INT (11) DEFAULT NULL,
        `book_id` INT (11) DEFAULT NULL,
        `quantity` DOUBLE NOT NULL,
        PRIMARY KEY (`orderdetailid`),
        KEY `order_id` (`order_id`),
        KEY `book_id` (`book_id`),
        CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
        CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;