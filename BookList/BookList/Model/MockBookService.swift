//
//  MockBookService.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 14/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

class MockBookService: BookService {

    static private var bookDescription = ""

    private var books: [Book] = [
        Book(id: "1", title: "The Lord of the Rings: The Fellowship of the Ring ", author: "J. R. R. Tolkien", genre: "Fantasy", publisher: "George Allen & Unwin", releaseDate: "29 July 1954", pagesNumber: 423, description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", coverImage: "image")
    ]

    func bookList() -> [Book] {
        return books
    }
}
