create table Books(
		Book_ID	SERIAL PRIMARY KEY,	
		Title VARCHAR (100),	
		Author VARCHAR (100),	
		Genre VARCHAR (100),	
		Published_Year INT,
		Price NUMERIC(10,2),	
		Stock INT	
);


create table Customer (
		Customer_ID	SERIAL PRIMARY KEY,
		Name VARCHAR(100),	
		Email VARCHAR(100),	
		Phone VARCHAR(100),	
		City VARCHAR(100),	
		Country VARCHAR(100)	
);


create table Orders(
Order_ID SERIAL PRIMARY KEY,				
Customer_ID	INT	REFERENCES Customer(Customer_ID),			
Book_ID	INT	REFERENCES Books(Book_ID),
Order_Date Date,			
Quantity INT,			
Total_Amount NUMERIC(10,2)			

);

select * from Books;

select * from Customer;

select * from Orders;

drop table if Exists Books;

drop table if Exists Customer;

drop table if Exists Orders;


----IMPORT DATA FROM BOOKS TABLE..

Copy Books (Book_ID,Title,Author,Genre,Published_Year,Price,Stock)
from 'D:\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Books.csv'
CSV HEADER ;


--IMPORT DATA FROM CUSTOMERS TABLE..

copy Customer (Customer_ID,Name,Email,Phone,City,Country)
from 'D:\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Customers.csv'
CSV HEADER ;


--IMPORT DATA FROM ORDERS TABLE..


copy Orders (Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
from 'D:\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Orders.csv'
CSV HEADER ;


SELECT * from Books
WHERE Genre='Fiction';

--find the books published after the year 1958:

select * from Books
where Published_Year>1958;

select * from Customer
where City='Canada';

--show orders placed in november 2023

select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30'; 

--retrieve the total stock of books available:

select sum(Stock) As total_stock
from Books;

--find the details of the most expensive books:

select * from Books order by Price desc limit 1;

--show all customers who orderd more than 1 quality of a book:

select * from Orders
where Quantity>1 ;

--retrieve all order where the total amount exceeds $20:

 select * from Orders
where Total_Amount>20 ;

--list all genres available in the books table:

select Distinct Genre from Books ;

--find the book with the lowest stock:

select * from Books order by Stock limit 1 ;

---calculate the total revenue genrated from all orders:

select sum(Total_Amount) as revenue from Orders;


------retrieve the total number of books sold for each genre :

select B.Genre , sum (O.Quantity) As Total_Books_Sold
from Orders O
join Books B on O.Book_ID = B.Book_id
Group by B.Genre;


--find the average price of books in the fantacy genre:

select avg(Price) AS Average_Price
from Books
where Genre = 'Fantacy';

--list Customer Who have placed at least 2 order:

select  Customer_ID , count(Order_ID) as Order_Count
from Orders
group by Customer_ID
having count(Order_ID) >=2 ;
















