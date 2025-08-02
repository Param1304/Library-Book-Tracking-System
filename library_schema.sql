-- Server version	8.0.19-debug
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @old_autocommit=@@autocommit;
-- Current Database: `world`
/*!40000 DROP DATABASE IF EXISTS `world`*/;
CREATE DATABASE `library` DEFAULT CHARACTER SET utf8mb4;
USE `library`;
-- Table structure for table `city`
DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE Books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each book.
    Title VARCHAR(255) NOT NULL,            -- Title of the book.
    Author VARCHAR(100),                    -- Author of the book.
    Category VARCHAR(50),                   -- Genre or category of the book.
    Available BOOLEAN DEFAULT 1             -- 1 = Available, 0 = Borrowed.
);
-- Create the Members table to store member information.
CREATE TABLE Members (
    Member_ID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each member.
    Name VARCHAR(100) NOT NULL,               -- Full name of the member.
    Email VARCHAR(100) UNIQUE NOT NULL        -- Email address (must be unique).
);
-- Create the Borrowed_Books table to track which books are borrowed by which members.
CREATE TABLE Borrowed_Books (
    Borrow_ID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each borrow record.
    Member_ID INT NOT NULL,                   -- ID of the member borrowing the book (foreign key).
    Book_ID INT NOT NULL,                     -- ID of the borrowed book (foreign key).
    Borrow_Date DATE,       -- Date the book was borrowed (defaults to today).
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID), -- Ensure Member_ID exists in Members table.
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)        -- Ensure Book_ID exists in Books table.
);
