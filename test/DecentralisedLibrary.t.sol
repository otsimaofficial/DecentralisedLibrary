// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import {DecentralisedLibrary} from "../src/DecentralisedLibrary.sol";

contract DecentralisedLibraryTest is Test {
    DecentralisedLibrary lib;
    address user = address(0xABCD);
    address anotherUser = address(0xEF01);

    function setUp() public {
        lib = new DecentralisedLibrary();
    }

    function testAddBook() public {
        lib.addBook("Solidity 101", "Vitalik", 3);
        DecentralisedLibrary.Book memory book = lib.getBook(0);

        assertEq(book.id, 0);
        assertEq(book.title, "Solidity 101");
        assertEq(book.author, "Vitalik");
        assertEq(book.copies, 3);
    }

    function testBorrowBook() public {
        lib.addBook("Ethereum for Kids", "Gavin", 2);

        vm.prank(user);
        lib.borrowBook(0);

        DecentralisedLibrary.Book memory book = lib.getBook(0);
        assertEq(book.copies, 1);
        assertTrue(lib.hasBorrowed(user, 0));
    }

    function testReturnBook() public {
        lib.addBook("Solidity Patterns", "Remix", 1);

        vm.startPrank(user);
        lib.borrowBook(0);
        lib.returnBook(0);
        vm.stopPrank();

        DecentralisedLibrary.Book memory book = lib.getBook(0);
        assertEq(book.copies, 1);
        assertFalse(lib.hasBorrowed(user, 0));
    }
}
