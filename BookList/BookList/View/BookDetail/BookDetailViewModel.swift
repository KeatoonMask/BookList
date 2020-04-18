//
//  BookDetailViewModel.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 18/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

class BookDetailViewModel: ViewModel {

    @Published
    var state: BookDetailState

    init(id: Int) {
        let detail = MockBookService().bookDetails(bookId: 0)
        state = BookDetailState(bookDetail: detail)
    }

    func trigger(_ input: Never) { }
}
