-- People(residents and students) living in a particular area with limited access to a physical library can borrow books from a digital library.
-- Books can be reserved and users receive notifications when the books available.
-- The code should not be run automatically, I have not commented out the creating tables code etc.
-- Have limited the use of using an alias for table names as its easier to read and follow without. 

CREATE DATABASE DigitalLibrary;
USE DigitalLibrary;

-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT CHECK (Age >= 18),
    ContactInfo VARCHAR(255),
    StudentID INT UNIQUE,
    LibraryCardNumber INT
);

-- Book Table
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Genre VARCHAR(50),
    Year INT
);

-- Checkout Table
CREATE TABLE Checkout (
    CheckoutID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    CheckoutDate DATE,
    DueDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

-- Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    ReservationDate DATE,
    NotificationPreferences VARCHAR(255),
    HasBeenNotfied BOOLEAN,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);


-- Insert into User Table
INSERT INTO User (UserID, Name, Age, ContactInfo, StudentID, LibraryCardNumber)
VALUES
    (1, 'John Doe', 30, 'john.doe@email.com', 65765, 12345),
    (2, 'Jane Smith', 25, 'jane.smith@email.com', 54321, NULL),
    (3, 'Alice Johnson', 22, 'alice.johnson@email.com', NULL, 67890),
    (4, 'Bob Williams', 28, 'bob.williams@email.com', 98765, 11436),
    (5,'Eva Brown', 35, 'eva.brown@email.com', NULL, 45678),
    (6, 'Michael Lee', 19, 'michael.lee@email.com', 23456, NULL),
    (7, 'Sara Davis', 27, 'sara.davis@email.com', 96721, 78901),
    (8, 'David Wilson', 32, 'david.wilson@email.com', 56123, 34567),
    (9, 'Emily Anderson', 21, 'emily.anderson@email.com', NULL, 56789),
    (10, 'Kevin Miller', 29, 'kevin.miller@email.com', 87654, 67401);

-- Insert into Book Table 
INSERT INTO Book (BookID, Title, Author, Genre, Year)
VALUES
    (30, 'Things Fall Apart', 'Chinua Achebe', 'Fiction', 1958),
    (40, 'Half of a Yellow Sun', 'Chimamanda Ngozi Adichie', 'Historical Fiction', 2006),
    (50, 'Purple Hibiscus', 'Chimamanda Ngozi Adichie', 'Fiction', 2003),
    (60, 'Americanah', 'Chimamanda Ngozi Adichie', 'Fiction', 2013),
    (70, 'Disgrace', 'J.M. Coetzee', 'Fiction', 1999),
    (80, 'The Power of One', 'Bryce Courtenay', 'Historical Fiction', 1989),
    (90, 'Nervous Conditions', 'Tsitsi Dangarembga', 'Fiction', 1988),
    (100, 'The Fishermen', 'Chigozie Obioma', 'Fiction', 2015),
    (110, 'Blackass', 'A. Igoni Barrett', 'Satire', 2015),
    (120, 'The Thing Around Your Neck', 'Chimamanda Ngozi Adichie', 'Short Stories', 2009);

-- 
ALTER TABLE Checkout
MODIFY COLUMN CheckoutID INT AUTO_INCREMENT;

-- Insert into Checkout Table
INSERT INTO Checkout (UserID, BookID, CheckoutDate, DueDate)
VALUES
    (1, 30, '2023-09-15', '2023-09-30'),
    (2, 40, '2023-09-18', '2023-10-03'),
    (3, 50, '2023-09-20', '2023-10-05'),
    (4, 60, '2023-09-22', '2023-10-07'),
    (5, 70, '2023-09-25', '2023-10-10'),
    (6, 80, '2023-09-28', '2023-10-14'),
    (7, 90, '2023-09-30', '2023-10-17'),
    (8, 100, '2023-10-02', '2023-10-21'),
    (9, 110, '2023-10-05', '2023-10-24'),
    (10, 120, '2023-10-08', '2023-10-28');
    
    -- Insert into Reservation Table
INSERT INTO Reservation (ReservationID, UserID, BookID, ReservationDate, NotificationPreferences, HasBeenNotfied)
VALUES
    (1, 1, 30, '2023-09-10', 'Email', TRUE),
    (2, 2, 40, '2023-09-12', 'Email', FALSE),
    (3, 3, 50, '2023-09-14', 'Email', TRUE),
    (4, 4, 60, '2023-09-16', 'Email', FALSE),
    (5, 5, 70, '2023-09-18', 'Email', TRUE),
    (6, 6, 80, '2023-09-20', 'None', FALSE),
    (7, 7, 90, '2023-09-22', 'Email', TRUE),
    (8, 8, 100, '2023-09-24', 'Email', FALSE),
    (9, 9, 110, '2023-09-26', 'Email', TRUE),
    (10, 10, 120, '2023-09-28', 'Email', FALSE);

-- USE AT LEAST 5 QUERIES TO RETRIEVE DATA 

-- Retrieve a list of books in a specific genre
SELECT Title, Author, Genre
FROM Book
WHERE Genre = 'Fiction'
ORDER BY Title ASC;

-- Retrieve the total number of books checked out by all users
SELECT COUNT(Checkout.BookID) AS TotalBooksCheckedOut
FROM Checkout;

-- Retrieve the oldest book in the library 
SELECT Title, Author, Year
FROM Book
ORDER BY Year ASC;

-- Retrieve reservations that have not been notified yet  
SELECT *
FROM Reservation
WHERE HasBeenNotfied = FALSE;


--  Retrieve all reservations for a specific user 
SELECT *
FROM Reservation
WHERE UserID = 3;

-- Retrieve the names and contact information of all users

SELECT Name, ContactInfo
FROM User;

-- USE AT LEAST 2 AGGREGATE FUNCTIONS 

-- Using an aggregate function to count the number of books checked out by each user 

SELECT User.Name, COUNT(Checkout.BookID) AS BooksCheckedOut
FROM User
LEFT JOIN Checkout ON User.UserID = Checkout.UserID
GROUP BY User.Name;

-- Using an aggregate function to find the maximum age of users 
SELECT MAX(Age) AS MaximumAge
FROM User;

-- USING BUILT IN FUNCTIONS

-- Using a built-in function to convert book titles to uppercase 
SELECT UPPER(Title) AS UppercaseTitle
FROM Book;

-- Using a built in function to retrieve the difference in days between the checkout date and the due date
SELECT CheckoutID, DATEDIFF(DueDate, CheckoutDate) AS DaysDifference
FROM Checkout;


-- USE AT LEAST 2 JOINS 

--  List books that are available for checkout 

SELECT Book.Title, Book.Author
FROM Book
LEFT JOIN Checkout ON Book.BookID = Checkout.BookID
WHERE Checkout.CheckoutID IS NULL;


 -- Find the most reserved book in the library
SELECT Book.Title AS MostReservedBook, COUNT(Reservation.BookID) AS ReservationCount
FROM Book
LEFT JOIN Reservation ON Book.BookID = Reservation.BookID
GROUP BY Book.Title
ORDER BY ReservationCount DESC;

-- USE A STORED PROCEDURE

DELIMITER //

CREATE PROCEDURE InsertNewUser(
	 userID INT,
     userName VARCHAR(255),
     userAge INT,
     userContactInfo VARCHAR(255),
     studentID INT,
     libraryCardNumber INT
)
BEGIN
    -- Insert a new user into the User table
    INSERT INTO User (UserID, Name, Age, ContactInfo, StudentID, LibraryCardNumber)
    VALUES (userID,userName, userAge, userContactInfo, studentID, libraryCardNumber);
END //

DELIMITER ;

-- testing out my sproc, this has already been ran
CALL InsertNewUser(12, 'Fadzai Mak', 25, 'Miss.Mak@email.com', NULL, 78901);

-- USE AT LEAST 1 QUERY TO DELETE DATA 
-- Delete a specific reservation
DELETE FROM Reservation WHERE ReservationID = 1;

-- THIS CODE SHOULD NOT BE RUN, ONLY ADDED TO ADD MORE DATA TO COLUMNS

-- adding more data into the reservation table
INSERT INTO Reservation(ReservationID, UserID, BookID, ReservationDate, NotificationPreferences, HasBeenNotfied)
VALUES (11, 2, 30, '2023-09-14', 'Email', FALSE),
	   (12, 4, 50, '2023-10-01', 'Email', FALSE),
       (13, 3, 120, '2023-10-03', 'Email', TRUE),
       (14, 10, 100, '2023-10-01', 'Email', TRUE),
       (15, 2, 60, '2023-09-30', 'Email', TRUE),
       (16, 2, 50, '2023-11-02', 'Email', TRUE);
       
       -- adding more data to the checkout table
       INSERT INTO Checkout(UserID, BookID, CheckoutDate, DueDate)
       VALUES(5, 30, '2023-09-30', '2023-10-07'),
             (2, 100, '2023-10-01', '2023-10-12'),
             (10, 80, '2023-10-14', '2023-10-21');





