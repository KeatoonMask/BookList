//
//  MockBookService.swift
//  BookList
//
//  Created by Finsi Ennes on 14/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

class MockBookService: BookService {

    static private var bookDescription = ""

    private var books: [Book] = [
        Book(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "fellow"),
        Book(id: 1, title: "The Two Towers", author: "J. R. R. Tolkien", price: 11.99, imageName: "twoTowers"),
        Book(id: 2, title: "Homo Deus: A Brief History of Tomorrow", author: "Yuval Noah Harari", price: 19.99, imageName: "homoDeus"),
        Book(id: 3, title: "The 4-Hour Workweek", author: "Timothy Ferriss", price: 16.15, imageName: "the4Hours"),
        Book(id: 4, title: "Man's Search for Meaning", author: "Viktor E. Frankl", price: 12.25, imageName: "manSearch"),
        Book(id: 5, title: "The Odyssey", author: "Homer", price: 10.99, imageName: "odyssey"),
        Book(id: 6, title: "Artificial Intelligence: A Modern Approach", author: "Stuart J. Rossell", price: 22.99, imageName: "ai"),
        Book(id: 7, title: "Creativity, Inc.", author: "Ed Catmull", price: 17.85, imageName: "creativity")
    ]

    private var booksDetail: [BookDetail] = [
        BookDetail(id: "1", bookId: 0, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, genre: [Genre.fantasy, Genre.action], kind: "Novel",description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "fellow", isAvailable: false)
    ]

    private var cart = Cart(items: [], numberOfItems: 0, total: 0)

    // MARK: Book list
    func bookList() -> [Book] {
        return books
    }

    // MARK: Book details
    func bookDetails(bookId: Int) -> BookDetail {
        let details = booksDetail.first{ $0.bookId == bookId }
        return details!
    }

    // MARK: Cart
    func cartItems() -> Cart {
        return cart
    }
    func numberOfCartItems() -> Int {
        return cart.numberOfItems
    }

    func addToCart(bookId: Int) {
        guard let book = (books.first{ $0.id == bookId }) else { return }

        // Update cart
        cart.numberOfItems += 1
        cart.total += book.price
        updateItemCart(book: book)
    }

    func removeFromCart(bookId: Int) {
        guard let index = (cart.items.firstIndex{ $0.item.id == bookId }) else { return }

        // Update number of items and total price of cart
        let units = cart.items[index].units
        let bookPrice = cart.items[index].item.price

        cart.numberOfItems -= units
        cart.total -= (bookPrice * Double(units))

        // Remove the item from the cart
        cart.items.remove(at: index)
    }
}

// MARK: - Private methods

private extension MockBookService {
    func updateItemCart(book: Book) {
        if let index = (cart.items.firstIndex{ $0.item.id == book.id }) {
            cart.items[index].units += 1
        } else {
            cart.items.append(Item(id: UUID().uuidString, item: book, units: 1))
        }
    }
}
