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
                NavigationLink(destination: BookDetailView(bookId: book.id)) {
                    BookRow(book: book)
                }
            }
            .navigationBarTitle("Library")
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AnyViewModel(BookListViewModel())
        return BookListView(viewModel: viewModel)
    }
}
