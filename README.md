# Library-Book-Tracking-System
 Library Book Tracking System enables efficient management of books and members in a library while keeping track of which members have borrowed specific books. This system will support essential operations like adding, updating, and deleting records for books and members and provide analytical insights.

 The system will:

Manage Books: Store details about books, including title, author, genre, publication year, and availability.
Manage Members: Keep track of library members, including their personal details and membership start date.
Track Borrowing: Record and manage which members have borrowed which books, including dates of borrowing and returning.
Support CRUD Operations:
Add, retrieve, update, and delete books and members.
Record borrowing and returning activities.
Generate Analytical Insights:
List of currently borrowed books.
Borrowing history of individual members.
Statistics, such as most borrowed books.

Kindly refer to the requirements below to start building your solution

1. Database Design
Create a database with the following tables:

Books Table: Stores information about the books available in the library, including:

Book_ID: Unique identifier for each book.
Title: Title of the book.
Author: Author of the book.
Category: Genre or category of the book.
Available: Indicates if the book is available for borrowing (1 for available, 0 for borrowed).
Members Table: Stores information about library members, including:

Member_ID: Unique identifier for each member.
Name: Full name of the member.
Email: Email address of the member.
Borrowed_Books Table: Tracks which books are currently borrowed by which members, including:

Borrow_ID: Unique identifier for each borrow record.
Member_ID: The ID of the member who borrowed the book.
Book_ID: The ID of the borrowed book.
Borrow_Date: The date the book was borrowed.
2. Basic Operations
Add Books: Add new books to the library.
Register Members: Add new members to the library.
Borrow Books:
Record that a book is borrowed by a member.
Mark the book as unavailable in the Books table (Available = 0).
Return Books:
Record that a book is returned by a member.
Mark the book as available in the Books table (Available = 1)

Designing a Library Book Tracking System involves creating a relational database to manage books, members, and borrowing records. The approach focuses on robust data relationships, CRUD operations, and analytical queries.

Step 1: Database Design
1. Identify Core Entities and Relationships
Books: Manage information about books and their availability status.
Members: Store details of library members.
Borrowed_Books: Track borrowing records, linking books to members.
2. Define Tables
Books: Tracks book details (Book_ID, Title, Author, Category, Available).
Members: Stores member information (Member_ID, Name, Email).
Borrowed_Books: Logs borrowing records (Borrow_ID, Member_ID, Book_ID, Borrow_Date).
3. Relationships Between Tables
Books.Book_ID → Borrowed_Books.Book_ID (Foreign Key)
Members.Member_ID → Borrowed_Books.Member_ID (Foreign Key)
4. Schema Design Principles
Use Primary Keys for unique identification (Book_ID, Member_ID, Borrow_ID).
Enforce Foreign Keys to ensure data consistency.
Use Constraints:
NOT NULL for required fields.
BOOLEAN for availability status.
Step 2: CRUD Operations
1. Add Books
Insert new book records into the Books table.
Default availability is set to 1 (available).
Tables Involved: Books

2. Register Members
Add new member records into the Members table.
Ensure unique email addresses.
Tables Involved: Members

3. Borrow Books
Create a new borrowing record in Borrowed_Books.
Update the Books table to mark the book as unavailable (Available = 0).
Tables Involved: Borrowed_Books, Books

4. Return Books
Remove the corresponding entry from Borrowed_Books.
Update the Books table to mark the book as available (Available = 1).
Tables Involved: Borrowed_Books, Books

Step 3: Key Query Use Cases
1. List All Available Books
Fetch books where Available = 1.
Tables Involved: Books

2. Fetch Books Borrowed by a Specific Member
Join Borrowed_Books with Books to retrieve borrowed books for a specific member (Member_ID).
Tables Involved: Borrowed_Books, Books

3. Count Total Books by Category
Group books by Category and count the total books in each group.
Tables Involved: Books

4. List All Members Who Have Borrowed Books
Use a join between Members and Borrowed_Books to retrieve distinct members who have borrowed books.
Tables Involved: Members, Borrowed_Books

Step 4: Transactions for Book Borrowing/Returning
1. Borrow a Book Transaction Workflow
Start a Transaction.
Insert a record in Borrowed_Books.
Update the Books table to mark the book as unavailable.
Commit the transaction if successful; otherwise, rollback.
Tables Involved: Borrowed_Books, Books

2. Return a Book Transaction Workflow
Start a Transaction.
Delete the borrowing record from Borrowed_Books.
Update the Books table to mark the book as available.
Commit or rollback based on success.
Tables Involved: Borrowed_Books, Books

Step 5: Analytical Queries
1. List All Available Books
Retrieve titles, authors, and categories of all available books.
Tables Involved: Books

2. Fetch Details of Books Borrowed by a Specific Member
Retrieve book details and borrowing dates for a member using Member_ID.
Tables Involved: Borrowed_Books, Books

3. Count Total Books in Each Category
Group books by category and count the total books in each group.
Tables Involved: Books

4. List All Active Borrowers
Fetch member names and emails who have borrowed books.
Tables Involved: Members, Borrowed_Books

Step 6: Optimization Strategies
1. Indexing
Add indexes on frequently queried columns:
Books.Book_ID
Members.Member_ID
Borrowed_Books.Book_ID
Borrowed_Books.Member_ID
2. Query Execution Plan
Analyze query performance using execution plans and optimize joins.
3. Constraints
Use constraints (NOT NULL, UNIQUE) to ensure data integrity.
