create database LIBRARY ;
USE LIBRARY
  
CREATE TABLE Branch
 (
  Branch_no VARCHAR(10) PRIMARY KEY,
  Manager_id VARCHAR(10),
  Branch_address VARCHAR(30), 
  Contact_no VARCHAR(15)
);
INSERT INTO Branch(Branch_no,Manager_id,Branch_address,Contact_no) 
  VALUES('B001', 'M101','koramangala Branch- NO.48','9099988676'),
 ('B002', 'M102','white Field Branch -NO.67','9099988677'),
 ('B003', 'M103','Jayanagar Branch -NO.22','9099988678'),
 ('B004', 'M104','Malleshwaram Branch -No.15','9099988679'),
 ('B005', 'M105','Electronic city Branch-NO.12','9099988680');

Select * from Branch;

CREATE TABLE Employee 
 (
    Emp_id VARCHAR(10) PRIMARY KEY,
    Emp_name VARCHAR(30), 
    Branch_no VARCHAR(10),
    Position VARCHAR(30),
    Salary DECIMAL(10,2),
	FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no),
	);
INSERT INTO Employee (Emp_id,Emp_name,Branch_no,Position,Salary)
 VALUES  ('E101','Kiran Kumar','B001','Manager', 60000.00),
  ('E102', 'Siva kumar','B001', 'Clerk', 45000.00),
  ('E103', 'Nagaraju', 'B001','Librarian', 55000.00),
  ('E104', 'prashanth','B001', 'Assistant', 40000.00),
  ('E105', 'David','B002','Assistant', 42000.00),
  ('E106', 'Ramu','B003','Assistant', 43000.00),
  ('E107', 'jashuva','B002','Manager', 62000.00),
  ('E108', 'pushpa','B002','Clerk', 46000.00),
  ('E109', 'likhi','B004','Librarian', 57000.00),
  ('E110', 'Vinay kumar','B003','Assistant', 41000.00);

 Select * from Employee;

CREATE TABLE Customer
 (
   Customer_Id VARCHAR(30) PRIMARY KEY,
   Customer_name VARCHAR(30),
   Customer_address VARCHAR(30),
   Reg_date DATE
);
INSERT INTO customer(Customer_id,Customer_name,Customer_address,Reg_date) 
 VALUES('C101', 'Venkatesh', 'koramangala Branch- NO.48', '2024-04-15'),
  ('C102', 'Krishna', 'white Field Branch -NO.67', '2023-10-20'),
  ('C103', 'Rajesh', 'Jayanagar Branch -NO.22', '2024-02-10'),
  ('C104', 'Dipak', 'Malleshwaram Branch -No.15', '2023-11-05'),
  ('C105', 'Rohit', 'Electronic city Branch-NO.12', '2024-01-25'),
  ('C106', 'Virat kohli','MG Road Branch-NO.45', '2024-03-15'),
  ('C107', 'Anjali devi', 'Indiranagar Branch-NO.12', '2023-11-20'),
  ('C108', 'Vikram', 'HSR layout Branch-NO.27', '2024-02-10'),
  ('C109', 'Divya', 'Bannerghatta Road Branch-NO.23', '2023-12-05'),
  ('C110', 'Sneha', 'Yelahanka Branch-NO.9', '2023-11-25');

   Select * from Customer;

CREATE TABLE IssueStatus 
(
  Issue_Id VARCHAR(10) PRIMARY KEY,
  Issued_customer VARCHAR(30),              
  Issued_book_name VARCHAR(100),
  Issue_date DATE,
  Isbn_book VARCHAR(30),
  FOREIGN KEY (Issued_customer) REFERENCES customer(Customer_id ),
  FOREIGN KEY (Isbn_book) REFERENCES books(ISBN ),
);
INSERT INTO IssueStatus(Issue_id,Issued_customer,Issued_book_name,Issue_date,Isbn_book)
VALUES('IS101', 'C101', 'The Catcher in the Rye', '2024-05-01', '978-0-553-29698-2'),
('IS102', 'C102', 'The Da Vinci Code', '2023-12-02', '978-0-330-25864-8'),
('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', '2024-02-20', '978-0-14-118776-1'),
('IS104', 'C104', 'Sapiens: A Brief History of Humankind', '2024-01-05', '978-0-525-47535-5'),
('IS105', 'C105', 'The Diary of a Young Girl', '2024-02-05', '978-0-141-44171-6');

Select * from IssueStatus;

CREATE TABLE ReturnStatus
 (
   Return_id VARCHAR(10) PRIMARY KEY,
   Return_cust VARCHAR(30),
   Return_book_name VARCHAR(80),    
   Return_date DATE,
   isbn_book2 VARCHAR(30),
   FOREIGN KEY (isbn_book2) REFERENCES books(isbn) 
); 
INSERT INTO ReturnStatus VALUES
  ('RS101', 'C101', 'The Catcher in the Rye', '2024-06-06', '978-0-553-29698-2'),
  ('RS102', 'C102', 'The Da Vinci Code', '2024-02-10', '978-0-7432-4722-4'),
  ('RS103', 'C105', 'Harry Potter and the Sorcerers Stone', '2024-05-15', '978-0-679-76489-8'),
  ('RS104', 'C108', 'The Histories', '2024-03-25', '978-0-14-118776-1'),
  ('RS105', 'C110', 'Jane Eyre', '2024-04-10', '978-0-141-44171-6');

 Select * from ReturnStatus;

CREATE TABLE Books
  (
   ISBN VARCHAR(30) PRIMARY KEY,
   Book_title VARCHAR(80),
   Category VARCHAR(30),
   Rental_Price DECIMAL(10,2),
   status varchar(54),
   Author VARCHAR(30),   
   Publisher VARCHAR(30),
); 
INSERT INTO Books VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00,'yes','J.D. Salinger', 'Little Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years  Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', ' Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States',' History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial');

Select * from Books

  -----------/*Queries*/--------------------

--1 Retrieve the book title, category, and rental price of all available books.

   SELECT book_title, category, rental_price FROM books WHERE Status = 'Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

   SELECT emp_name, salary FROM employee ORDER BY Salary DESC;

--3. Retrieve the book titles and the corresponding customers who have issued those books.

   SELECT issuestatus.Issued_book_name, customer.Customer_name FROM issuestatus INNER JOIN
   customer on issuestatus.Issued_customer = customer.Customer_Id;

--4. Display the total count of books in each category.

   SELECT Category, COUNT(Book_title) as Total_count FROM books GROUP BY Category;

--5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

   SELECT emp_name, position FROM employee WHERE Salary > 50000;

--6. List the customer names who registered before 2024-04-03 and have not issued any books yet.

    SELECT customer_name FROM customer WHERE Reg_date < '2024-04-03' AND Customer_Id NOT IN
   (SELECT issued_customer FROM issuestatus);
 
-- 7.Display the branch numbers and the total count of employees in each branch

   Select Branch_no,count(emp_id) as Total_count from employee group by Branch_no;

--8. Display the names of customers who have issued books in the month of February 2024.

   SELECT customer.Customer_name FROM customer INNER JOIN issuestatus ON 
   customer.Customer_Id = issuestatus.Issued_customer WHERE issuestatus.Issue_date >= '2024-02-01' AND 
   issuestatus.Issue_date <= '2024-02-28';

--9. Retrieve book_title from book the book table containing the category 'classic'.

    SELECT book_title FROM books WHERE Category = 'classic';

--10.Retrieve the branch numbers and along with the count of employees for branches having more than 5 employees.

    SELECT Branch_no,COUNT(emp_id) AS emp_id FROM employee GROUP BY branch_no HAVING COUNT(Emp_id) > 2;

--11.Retrieve the highest rental price from books table.

    select * from books where Rental_price in (select max(rental_price) from books where rental_price<=
    (select max(rental_price) from books));

--12.How do you create a store procedure in SQL server,execute a store procedure and Delete store procedure on it.
 
--# Creation of store procedure ;

    Create procedure Sp_GetEmployeesalary
   (
    @Emp_name varchar(20),
    @Salary Decimal(8,2)
   )
    AS
    Begin
    select * from employee where Emp_name = @Emp_name
    Select * from Employee where salary >=@salary
    END;

--Exection of astore procedure;

    Execute Sp_GetEmployeesalary 'Nagaraju', 2000;
 
--Deleting a store procedure;

    Drop procedure  Sp_GetEmployeesalary;

--13.Find the highest_ranked employees in each Branch_no.

  with Ranked_employees As
   ( 
    Select
    Branch_no,
	salary,
	position,
    Dense_rank()over( partition by Branch_no order by salary desc)
    As rank from Employee
   )
    select
    Branch_no,
    Salary,
    position
    from Ranked_employees where rank =1;

 --END

   

