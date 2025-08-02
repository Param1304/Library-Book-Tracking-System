-- list all books that are currently available
select Book_ID, Title, Author, Category
from books
where Available = 1;

-- count total number of books in each category
select Category, count(Book_ID) as NumberofBooks
from books
group by Category;

-- list all members who have borrowed the book 
select distinct m.Name, m.Email 
from members m 
join borrowed_books b on m.Member_ID = b.Member_ID;
