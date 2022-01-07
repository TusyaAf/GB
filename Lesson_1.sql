Microsoft Windows [Version 10.0.19043.1415]
(c) Корпорация Майкрософт (Microsoft Corporation). Все права защищены.

C:\Users\79104>mysql -u root -p
Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.02 sec)

mysql> CREATE DATABASE example;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> CREATE TABLE users;
ERROR 1046 (3D000): No database selected
mysql> CREATETABLE users (id SERIAL, name VARCHAR (100) NOT NULL UNIQUE);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREATETABLE users (id SERIAL, name VARCHAR (100) NOT NULL UNIQUE)' at line 1
mysql> USE exampl;
ERROR 1049 (42000): Unknown database 'exampl'
mysql> CREATE TABLE users (id INTEGER, name VARCHAR(100) NOT NULL UNIQUE);
ERROR 1046 (3D000): No database selected
mysql> USE example
Database changed
mysql>  CREATE TABLE users (id INTEGER, name VARCHAR(100) NOT NULL UNIQUE);
Query OK, 0 rows affected (0.03 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_example |
+-------------------+
| users             |
+-------------------+
1 row in set (0.01 sec)

mysql> exit
Bye

C:\Users\79104>mysqldump -u root -p
Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help

C:\Users\79104>mysqldump -u root -p example
Enter password: *******
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: example
-- ------------------------------------------------------
-- Server version       8.0.27

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 12:19:07

C:\Users\79104>mysqldump -u root -p example > example.sql
Enter password: ******
mysqldump: Got error: 1045: Access denied for user 'root'@'localhost' (using password: YES) when trying to connect

C:\Users\79104>mysqldump -u root -p example > example.sql
Enter password: *******

C:\Users\79104>dir
 Том в устройстве C имеет метку Windows
 Серийный номер тома: 2AF0-B217

 Содержимое папки C:\Users\79104

07.01.2022  12:20    <DIR>          .
07.01.2022  12:20    <DIR>          ..
01.10.2021  23:19    <DIR>          3D Objects
01.10.2021  23:19    <DIR>          Contacts
06.01.2022  18:14    <DIR>          Desktop
24.11.2021  08:54    <DIR>          Documents
07.01.2022  12:03    <DIR>          Downloads
07.01.2022  12:21             1 896 example.sql
01.10.2021  23:19    <DIR>          Favorites
01.10.2021  23:19    <DIR>          Links
01.10.2021  23:19    <DIR>          Music
01.01.2022  14:04    <DIR>          OneDrive
01.10.2021  23:58    <DIR>          OpenVPN
08.12.2021  09:25    <DIR>          Pictures
01.10.2021  23:19    <DIR>          Saved Games
01.10.2021  23:21    <DIR>          Searches
04.10.2021  17:10    <DIR>          Videos
               1 файлов          1 896 байт
              16 папок  179 002 892 288 байт свободно

C:\Users\79104>mysql -u root -p
Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE sample;
Query OK, 1 row affected (0.01 sec)

mysql> exit
Bye

C:\Users\79104>mysql -u root -p sample < example.sql
Enter password: *******

C:\Users\79104>mysql -u root -p
Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 26
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE sample;
Database changed
mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0.00 sec)

mysql> exit
Bye

C:\Users\79104>mysql -u root -p
Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> exit
Bye

C:\Users\79104>mysql
ERROR 1045 (28000): Access denied for user 'ODBC'@'localhost' (using password: NO)

C:\Users\79104>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 32
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>