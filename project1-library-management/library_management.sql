CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    BirthDate DATE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    AuthorID INT,
    PublicationYear INT,
    Genre NVARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    MembershipDate DATE,
    Email NVARCHAR(100)
);

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;


INSERT INTO Authors (FirstName, LastName, BirthDate)
VALUES
('George', 'Orwell', '1903-06-25'),
('Jane', 'Austen', '1775-12-16'),
('Mark', 'Twain', '1835-11-30');

INSERT INTO Books (Title, AuthorID, PublicationYear, Genre)
VALUES
('1984', 1, 1949, 'Dystopian'),
('Pride and Prejudice', 2, 1813, 'Romance'),
('The Adventures of Huckleberry Finn', 3, 1884, 'Adventure');

INSERT INTO Members (FullName, MembershipDate, Email)
VALUES
('Alice Johnson', '2023-01-15', 'alice@example.com'),
('Bob Smith', '2023-02-20', 'bob@example.com'),
('Charlie Brown', '2023-03-05', 'charlie@example.com');

