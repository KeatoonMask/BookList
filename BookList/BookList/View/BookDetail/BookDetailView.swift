//
//  BookDetailView.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 18/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookDetailState {
    var bookDetail: BookDetail
}

struct BookDetailView: View {

    @ObservedObject
    var viewModel: AnyViewModel<BookDetailState, Never>

    init(bookId: Int) {
        self.viewModel = AnyViewModel(BookDetailViewModel(id: bookId))
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return BookDetailView(bookId: 0)
    }
}

