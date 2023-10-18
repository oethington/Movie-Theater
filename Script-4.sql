-- Customers table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Movies table
CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    release_date DATE,
    duration INT,
    rating VARCHAR(10),
    genre VARCHAR(50)
);

-- Tickets table
CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    movie_id INT REFERENCES Movies(movie_id),
    showtime TIMESTAMP,
    seat_number VARCHAR(10),
    price NUMERIC(5, 2)
);

-- Concessions table
CREATE TABLE Concessions (
    concession_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    item_name VARCHAR(100),
    purchase_date DATE,
    price NUMERIC(5, 2),
    quantity INT
);

-- Relationships and Reasoning:

--Customers can purchase Tickets for Movies:

--Many Customers can purchase Many Tickets (Many-to-Many relationship).
--A Customer may purchase multiple Tickets for different Movies.
--A Movie may have multiple Customers purchasing Tickets.
--Customers can purchase Concessions:

--Many Customers can purchase Many Concessions (Many-to-Many relationship).
--A Customer may purchase multiple Concessions.
--A Concession may be purchased by multiple Customers.
--Tickets are associated with Movies:

--Many Tickets can belong to One Movie (Many-to-One relationship).
--Each Ticket is for a specific Movie.


-- Insert data into the Customers table
INSERT INTO Customers (first_name, last_name, email, phone)
VALUES
    ('John', 'Doe', 'johndoe@example.com', '123-456-7890'),
    ('Jane', 'Smith', 'janesmith@example.com', '987-654-3210'),
    ('Alice', 'Johnson', 'alicejohnson@example.com', '555-123-4567');

-- Insert data into the Movies table
INSERT INTO Movies (title, release_date, duration, rating, genre)
VALUES
    ('Movie 1', '2023-01-15', 120, 'PG-13', 'Action'),
    ('Movie 2', '2023-02-20', 110, 'PG', 'Comedy'),
    ('Movie 3', '2023-03-25', 135, 'R', 'Drama');

-- Insert data into the Tickets table
INSERT INTO Tickets (customer_id, movie_id, showtime, seat_number, price)
VALUES
    (1, 1, '2023-01-15 15:30:00', 'A1', 12.99),
    (2, 2, '2023-02-20 18:00:00', 'B2', 10.99),
    (1, 3, '2023-03-25 20:15:00', 'C5', 14.99);

-- Insert data into the Concessions table
INSERT INTO Concessions (customer_id, item_name, purchase_date, price, quantity)
VALUES
    (1, 'Popcorn', '2023-01-15', 5.99, 2),
    (2, 'Soda', '2023-02-20', 3.99, 3),
    (1, 'Candy', '2023-03-25', 2.99, 1);
   
select *
from Customers, Movies, Tickets, Concessions;
