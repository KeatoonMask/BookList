//
//  BookService.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 14/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

protocol BookService {
    func bookList() -> [Book]
}
