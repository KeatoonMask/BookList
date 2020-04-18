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

    init() {
        let books = MockBookService().bookList()
//        var detailViewModels = [AnyViewModel<BookDetailState, Never>]()
//        for book in books {
//            let viewModel = AnyViewModel(BookDetailViewModel(id: book.id))
//            detailViewModels.append(viewModel)
//        }
        self.state = BookListState(books: books)
    }

    func trigger(_ input: Never) { }
}
