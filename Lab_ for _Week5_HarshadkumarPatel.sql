-- Name         : Harshadkumar Patel
-- Student ID   : N01481887

--1. Get a list of all books, including the author's names (duplicate books are okay, if the book has multiple authors).
SELECT title, CONCAT(first_name,' ',last_name) AS Name
FROM authorship 
JOIN books
	ON authorship.book_id = books.book_id
JOIN authors 
	ON authorship.author_id = authors.author_id;

--2. Get a list of all books withdrawn by people with the initials 'B.W.'. Show a column for the first name, last name, initials, and the title of the book.
-- Remember: keep things concise.

SELECT first_name, last_name, CONCAT(LEFT(first_name,1),'.',LEFT(last_name,1),'.') AS intial, title  
FROM withdrawals 
JOIN members 
	ON withdrawals.member_id = members.member_id
JOIN books 
	ON withdrawals.book_id = books.book_id
WHERE members.first_name LIKE 'B%' AND members.last_name  LIKE 'W%';

-- 3 Get the number of books written by each American author. Include the first and last names of the author. Note that America might be represented in the 'country' column in more than one way - always check your results table to make sure you're getting the expected results.

SELECT CONCAT(first_name,' ',last_name) AS Author_Name, count(*) AS No_of_Books
FROM authorship 
JOIN books 
	ON authorship.book_id = books.book_id
JOIN authors 
	ON authorship.author_id = authors.author_id
WHERE country='USA'
GROUP BY Author_Name;

-- 4 For any book withdrawn in October, get the member's first name, last name, the withdrawal date and the book's title. Hint: Try getting the month from a date using the scalar function MONTH()
SELECT first_name, last_name, withdrawal_date, title  
FROM withdrawals 
JOIN members
	ON withdrawals.member_id = members.member_id
JOIN books 
	ON withdrawals.book_id = books.book_id
WHERE MONTH(withdrawal_date) = 10;

-- 5 Get a list of people who have ever returned overdue books (i.e. any withdrawal where the return date is greater than the due date). Remember that, unless otherwise specified, lists shouldn't contain duplicate rows.
SELECT DISTINCT CONCAT(first_name,' ' ,last_name) AS Name
FROM withdrawals 
JOIN members 
	ON withdrawals.member_id = members.member_id
WHERE return_date > due_date;

-- 6 Get a list of all authors, and the books they wrote. Include authors multiple times if they wrote multiple books. Also include authors who don't have any books in the database. Hint: this is a tricky one - think back on why right joins exist in the first place.
SELECT first_name, last_name, title FROM authorship aship
JOIN books 
	ON aship.book_id = books.book_id 
RIGHT JOIN authors 
	ON  aship.author_id =authors.author_id;

-- 7 Get a list of members who've never withdrawn a book. Hint: outer joins return rows with null values if there is no match between the tables.
SELECT first_name, last_name, withdrawal_date  
FROM withdrawals 
RIGHT JOIN members 
	ON withdrawals.member_id = members.member_id
WHERE withdrawal_date IS NULL;

-- 8 Rewrite the above query as the opposite join (if you used a left join, rewrite it as a right join; if you used a right join, rewrite it as a left join). The results table should contain the same data.
SELECT first_name, last_name, withdrawal_date  
FROM members 
LEFT JOIN withdrawals 
	ON members.member_id = withdrawals.member_id
WHERE withdrawal_date IS NULL;

-- 9 Cross join books and authors. Isn't that ridiculous?
SELECT first_name, last_name, title
FROM authors
CROSS JOIN books;

-- 10 Get a list of all members who have the same first name as other members. Sort it by first name so you can verify the data.
SELECT first_name  FROM members
GROUP BY first_name 
HAVING COUNT(first_name) > 1
ORDER BY first_name;














