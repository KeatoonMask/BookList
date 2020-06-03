//
//  BookService.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 14/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

protocol BookService {
    // Book list
    func bookList() -> [Book]

    // Book detail
    func bookDetails(bookId: Int) -> BookDetail
    func numberOfCartItems() -> Int
    func addToCart(bookId: Int)

    // Cart
    func cartItems() -> Cart
    func checkout()
}
