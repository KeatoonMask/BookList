//
//  Cart.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 25/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

struct Item: Identifiable {
    var id: String
    var item: Book
    var units: Int
}

struct Cart {
    var items: [Item]
    var numberOfItems: Int
    var total: Double
}
