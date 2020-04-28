//
//  CartViewModel.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 26/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

class CartViewModel: ViewModel {

    @Published
    var state: CartState
    private var service: BookService

    init(service: BookService) {
        let cart = service.cartItems()
        self.state = CartState(cart: cart)
        self.service = service
    }

    func trigger(_ input: CartInput) {
        switch input {
        case .checkout:
            service.checkout()
            state.cart = service.cartItems()
        }
    }
    
}
