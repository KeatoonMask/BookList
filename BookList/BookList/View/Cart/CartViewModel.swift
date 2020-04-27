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

    init(service: BookService) {
        let cart = service.cartItems()
        state = CartState(cart: cart)
    }

    func trigger(_ input: CartInput) {
        switch input {
        case .checkout:
            print("")
        }
    }
    
}
