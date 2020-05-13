//
//  CartView.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 23/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct CartState {
    var cart: Cart
}

enum CartInput {
    case checkout
}

struct CartView: View {

    @Binding var showModal: Bool

    @State private var showingAlert = false

    @ObservedObject
    var viewModel: AnyViewModel<CartState, CartInput>

    init(service: BookService, showModal: Binding<Bool>) {
        self.viewModel = AnyViewModel(CartViewModel(service: service))
        self._showModal = showModal
    }

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // Dismiss button
                HStack() {
                    Image("iconClose")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(20)

                    Spacer()
                }

                // Title
                VStack {
                    Text("Your bag")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    Text(String(viewModel.state.cart.numberOfItems) + " items")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }

                // Item list
                VStack(alignment: .leading) {
                    ForEach(viewModel.state.cart.items) { item in
                        CartRow(item: item)
                    }
                }

                Spacer().frame(height: 20)

                // Summary
                HStack {
                    VStack {
                        Image("shipping")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.bottom, -8)
                        Text("FREE")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                    }.frame(width: 64, height: 64)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(15)

                    Spacer().frame(width: 40)

                    VStack(alignment: .leading) {
                        Text("Total:")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Text("$" + String(roundTotal(viewModel.state.cart.total)))
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                    }

                    Spacer().frame(width: 80)
                }

                // Checkout button
                Divider().padding()

                Button(action: {
                    self.showingAlert = true
                }) {
                    HStack {
                        Text("Checkout")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    .frame(width: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(40)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Order confirmed"),
                          message: Text("Thank you for your purchase."),
                          dismissButton: .default(Text("Done")) {
                            self.showModal.toggle()
                            self.viewModel.trigger(.checkout)
                    })
                }
            }
        }
    }
}

private extension CartView {
    func roundTotal(_ total: Double) -> Double {
        let divisor = pow(10.0, Double(2))
        return (total * divisor).rounded() / divisor
    }

    func checkout() {
        viewModel.trigger(.checkout)
        self.showModal.toggle()
    }
}
