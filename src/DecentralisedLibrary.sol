// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DecentralisedLibrary {
    struct Book {
        uint256 id;
        string title;
        string author;
        uint256 copies;
    }

    uint256 public nextBookId;
    mapping(uint256 => Book) public books;
    mapping(address => mapping(uint256 => bool)) public hasBorrowed;

    event BookAdded(uint256 indexed id, string title, string author, uint256 copies);
    event BookBorrowed(address indexed user, uint256 indexed bookId);
    event BookReturned(address indexed user, uint256 indexed bookId);

    // Add a new book to the library
    function addBook(string memory _title, string memory _author, uint256 _copies) public {
        require(_copies > 0, "Copies must be greater than 0");

        books[nextBookId] = Book(nextBookId, _title, _author, _copies);
        emit BookAdded(nextBookId, _title, _author, _copies);
        nextBookId++;
    }

    // Borrow a book
    function borrowBook(uint256 _bookId) public {
        require(msg.sender != address(0), "Invalid address");
        Book storage book = books[_bookId];
        require(book.copies > 0, "No copies available");
        require(!hasBorrowed[msg.sender][_bookId], "You already borrowed this book");

        book.copies -= 1;
        hasBorrowed[msg.sender][_bookId] = true;
        emit BookBorrowed(msg.sender, _bookId);
    }

    // Return a book
    function returnBook(uint256 _bookId) public {
        require(msg.sender != address(0), "Invalid address");
        require(hasBorrowed[msg.sender][_bookId], "You did not borrow this book");

        books[_bookId].copies += 1;
        hasBorrowed[msg.sender][_bookId] = false;
        emit BookReturned(msg.sender, _bookId);
    }

    // View book details
    function getBook(uint256 _bookId) public view returns (Book memory) {
        return books[_bookId];
    }
}
