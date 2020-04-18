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
        Book(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien"),
        Book(id: 1, title: "The Lord of the Rings: The Two Towers", author: "J. R. R. Tolkien"),
        Book(id: 2, title: "Homo Deus: A Brief History of Tomorrow", author: "Yuval Noah Harari"),
        Book(id: 3, title: "The 4-Hour Workweek", author: "Timothy Ferriss"),
        Book(id: 4, title: "Man's Search for Meaning", author: "Viktor E. Frankl"),
        Book(id: 5, title: "The Odyssey", author: "Homer"),
        Book(id: 6, title: "Artificial Intelligence: A Modern Approach", author: "Stuart J. Rossell"),
        Book(id: 7, title: "Creativity, Inc.", author: "Ed Catmull")
    ]

    private var booksDetail: [BookDetail] = [
        BookDetail(id: "1", bookId: 0, genre: "Fantasy", publisher: "George Allen & Unwin", releaseDate: "29 July 1954", pagesNumber: 423, description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "image")
    ]

    func bookList() -> [Book] {
        return books
    }

    func bookDetails(bookId: Int) -> BookDetail {
        let details = booksDetail.first{ $0.bookId == bookId }
        return details!
    }
}
