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

    init(service: BookService, id: Int) {
        let detail = service.bookDetails(bookId: id)
        let items = service.numberOfCartItems()
        state = BookDetailState(service: service, bookDetail: detail, cartItems: items)
    }

    func trigger(_ input: BookDetailInput) {
        switch input {
        case .addBookToCart:
            state.service.addToCart(bookId: state.bookDetail.bookId)
            state.cartItems = state.service.numberOfCartItems()
        case .reloadState:
            state.bookDetail = state.service.bookDetails(bookId: state.bookDetail.bookId)
            state.cartItems = state.service.numberOfCartItems()
        }
    }
}
