-- -- CRUD operations

-- add a new book to library collection
insert into books (Title,Author,Category) values
('Deep Learning with Python', 'Francois Chollet','Programming');

-- borrow a book
insert into borrowed_books (Borrow_ID, Member_ID, Book_ID, Borrow_Date) values
(21, 4, 90, '2025-07-31');
-- select * from borrowed_books
-- order by Borrow_ID desc limit 5

-- Update the availability status of the borrowed book in the Books table.
update books set Available = 0 where Book_ID = 90;

-- Return a book (Remove the borrowing record from Borrowed_Books)
delete from borrowed_books where Book_ID=90 and Member_ID=4;

-- Update the availability status of the returned book in the Books table.
update books set Available = 1 where Book_ID = 90;

