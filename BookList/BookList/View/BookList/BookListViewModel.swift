//
//  BookListViewModel.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 16/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

class BookListViewModel: ViewModel {

    @Published
    var state: BookListState

    init(books: [Book]) {
        self.state = BookListState(books: books)
    }

    func trigger(_ input: Never) { }
}
