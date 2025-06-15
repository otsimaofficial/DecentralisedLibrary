# 📚 Decentralised Library

A smart contract built in Solidity for managing a decentralized library system where users can borrow and return books transparently on the blockchain.

---

## 🚀 Features

- Add books with unique ID, title, author, and copy count.
- Borrow and return books securely.
- Prevent double-borrowing of the same book by a user.
- Prevent interactions from `address(0)`.
- View book details by ID.

---

## 🛠️ Tech Stack

- **Solidity `^0.8.26`**
- **Foundry** (for testing and development)
- **Ethereum-compatible networks**

---

## 🧱 Contract Structure

### `Book` Struct
```solidity
struct Book {
    uint id;
    string title;
    string author;
    uint copies;
}
````

### Key Functions

| Function             | Description                               |
| -------------------- | ----------------------------------------- |
| `addBook(...)`       | Add a new book with title, author, copies |
| `borrowBook(bookId)` | Borrow a book if available                |
| `returnBook(bookId)` | Return a previously borrowed book         |
| `getBook(bookId)`    | View book details                         |

---

## ✅ Access Rules

* Only valid, non-zero addresses can borrow/return books.
* A user **cannot borrow the same book twice** without returning it.
* A book **cannot be borrowed** if no copies are available.

---

## 🔐 Security

* Checks against `address(0)`
* Prevents double borrowing
* Prevents over-returning
* Only non-zero copy books can be added

---

## 🧪 Testing

Unit tests written in **Foundry** cover:

* Adding books
* Borrowing & returning
* Edge cases like no copies or invalid users

### Run tests:

```bash
forge test
```

---

## 🗂️ File Structure

```
DecentralisedLibrary/
│
├── src/
│   └── DecentralisedLibrary.sol     # Smart contract logic
│
├── test/
│   └── DecentralisedLibrary.t.sol   # Foundry test suite
│
├── lib/                             # Dependencies (via forge install)
├── README.md
└── foundry.toml                     # Foundry config
```

---

## 👨‍💻 Author

**Otsima Ogbu**
GitHub: [@otsimaofficial](https://github.com/otsimaofficial)

---

## 📜 License

This project is licensed under the **MIT License**.

```

---

Would you like this `README.md`:
- Saved and committed for you?
- Automatically include badges (build passing, license, etc)?
- With a usage demo (maybe future UI integration)?

Let me know — we can version it for Hackathons or Devpost too!
```
