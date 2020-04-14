//
//  Book.swift
//  BookList
//
//  Created by Finsi Ennes on 14/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

struct Book: Codable, Identifiable {
    var id: String
    var title: String
    var author: String
    var genre: String
    var publisher: String
    var releaseDate: String
    var pagesNumber: Int
    var description: String
    var coverImage: String
}
