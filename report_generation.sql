-- -- Report Generation
 -- Generate a report of all borrowed books along with member and borrow details.
SELECT bb.Borrow_ID, m.Name AS Member, b.Title AS Book, bb.Borrow_Date
FROM Borrowed_Books bb
JOIN Members m ON bb.Member_ID = m.Member_ID
JOIN Books b ON bb.Book_ID = b.Book_ID
ORDER BY bb.Borrow_Date;

-- Generate a summary of available and borrowed books.
SELECT 
    SUM(CASE WHEN Available = 1 THEN 1 ELSE 0 END) AS Available_Books, -- Count available books.
    SUM(CASE WHEN Available = 0 THEN 1 ELSE 0 END) AS Borrowed_Books  -- Count borrowed books.
FROM Books;