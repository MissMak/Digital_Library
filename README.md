# **Digital Library System - SQL Project**

## **Project Overview**

This project models a **Digital Library System** for residents and students in an area with limited access to physical libraries. The system allows users to:
- **Borrow books** from the digital library.
- **Reserve books** and get notified when the reserved book becomes available.

The project’s SQL code simulates the core functionality of such a system, including data about users, books, checkouts, reservations, and notifications.

## **Features**

- **Book Borrowing**: Users can check out books from the library's digital collection.
- **Book Reservations**: If a book is unavailable, users can place a reservation and receive notifications when it becomes available.
- **Notifications**: Notifications are tracked for each reservation based on user preferences.

## **Technical Details**

- **Table Structure**:
  - `User`: Stores user information like name, contact details, and student/library IDs.
  - `Book`: Stores information about available books, including title, author, genre, and publication year.
  - `Checkout`: Tracks when books are checked out by users, including checkout and due dates.
  - `Reservation`: Manages book reservations and notification statuses for users.

- **Queries**:
  - Example queries include retrieving books by genre, checking reservation statuses, counting total checkouts, and finding users who haven’t been notified of available reservations.

## **Key Considerations**

- **Manual Execution**: The code should be executed manually in a SQL environment. Table creation, data insertion, and queries must be run step by step.
- **No Aliases**: To improve readability, minimal use of table name aliases is applied, making the queries easier to follow.
- **Stored Procedures**: A stored procedure (`InsertNewUser`) is included to automate the process of adding new users.

## **Running the Project**

1. **Database Setup**:
   - Create a database (`DigitalLibrary`) and run the provided SQL scripts for table creation and data population.

2. **Sample Data**:
   - The scripts include sample data for `User`, `Book`, `Checkout`, and `Reservation` tables.

3. **Sample Queries**:
   - Several example queries are provided to retrieve and manipulate data, such as:
     - Retrieving books in a specific genre.
     - Counting the total books checked out.
     - Listing reservations for users.

## **Important Notes**

- The **SQL code should not be run automatically**. Ensure you carefully review and execute the code manually, especially the table creation and data insertion sections.
- If necessary, additional data can be added to the tables using the provided `INSERT INTO` statements.
- The code includes a **DELETE** statement to demonstrate how to remove a specific reservation record.

## **SQL Queries Demonstrated**

1. **Basic Retrieval**: Retrieve lists of books, users, and reservation details.
2. **Aggregate Functions**: Examples of counting checked-out books and finding the maximum age of users.
3. **Joins**: Use of `LEFT JOIN` to find available books and the most reserved book.
4. **Built-In Functions**: Example queries to convert text to uppercase and calculate date differences.
5. **Stored Procedure**: The code includes a stored procedure for adding new users into the system.
6. **Data Deletion**: A query for deleting a specific reservation.

