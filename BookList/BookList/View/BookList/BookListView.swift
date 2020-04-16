//
//  BookListView.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 16/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookListState {
    var books: [Book]
}

struct BookListView: View {

    @ObservedObject
    var viewModel: AnyViewModel<BookListState, Never>

    var body: some View {
        NavigationView {
            List(viewModel.books) { book in
                BookRow(book: book)
            }
            .navigationBarTitle("Library")
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        let booksService = MockBookService()
        let books = booksService.bookList()
        let viewModel = AnyViewModel(BookListViewModel(books: books))
        return BookListView(viewModel: viewModel)
    }
}
