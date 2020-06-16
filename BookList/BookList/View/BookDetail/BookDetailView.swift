//
//  BookDetailView.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 18/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookDetailState {
    var service: BookService
    var bookDetail: BookDetail
    var cartItems: Int
}

enum BookDetailInput {
    case addBookToCart
    case reloadState
}

// MARK: - Book Detail
struct BookDetailView: View {

    @ObservedObject
    var viewModel: AnyViewModel<BookDetailState, BookDetailInput>

    @State private var showModal = false
    @State private var showAlert = false

    init(service: BookService, bookId: Int) {
        self.viewModel = AnyViewModel(BookDetailViewModel(service: service, id: bookId))
    }

    var body: some View {
        VStack {

            BookDetailImage(image: viewModel.bookDetail.image)

            Spacer()
                .frame(height: 30)

            Text(viewModel.bookDetail.author)
                .foregroundColor(.gray)

            Text(viewModel.bookDetail.title)
                .font(.system(size: 24, weight: .semibold))
                .padding([.leading, .trailing], 20)


            Spacer()
                .frame(height: 20)

            Text(viewModel.bookDetail.description)
                .lineLimit(4)
                .padding([.leading, .trailing], 20)
                .lineSpacing(6)
                .foregroundColor(.gray)

            Spacer()
                .frame(height: 20)

            HStack(spacing: 20) {
                ForEach(0 ..< viewModel.bookDetail.genre.count, id: \.self) { index in
                    BookDetailLabel(text: self.viewModel.bookDetail.genre[index].description)

                }
                BookDetailLabel(text: viewModel.bookDetail.kind)
            }
            .padding(.bottom, 10)

            Divider()
                .padding(.bottom, 30)
                .padding([.leading, .trailing], 20)



            if viewModel.bookDetail.isAvailable {
                // Read button
                Button(action: { self.showModal = true }) {
                    BookDetailButton(text: "Read", buttonColor: Color.green)
                }
                .sheet(isPresented: self.$showModal) {
                    BookReadingView(titleBook: self.viewModel.bookDetail.title)
                }

            } else {
                // Add button
                Button(action: {
                    self.addToCart()
                    self.showAlert = true
                }) {
                    BookDetailButton(text: "Buy for " + String(viewModel.bookDetail.price) + "$",
                    buttonColor: Color.black)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Book added to cart"), message: Text("You're ready to proceed to checkout and complete your order."), dismissButton: .default(Text("Done")))
                }
            }           
        }

        // NavBar item - Checkout button
        .navigationBarItems(trailing:
            Button(action: {
                self.showModal = true
            }) {
                CartButtonView(numberOfItems: self.viewModel.cartItems)
            }.sheet(isPresented: self.$showModal, onDismiss: { self.reload() }) {
                CartView(service: self.viewModel.state.service, showModal: self.$showModal)
            })
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Private extension
private extension BookDetailView {
    func addToCart() {
        viewModel.trigger(.addBookToCart)
    }

    func reload() {
        viewModel.trigger(.reloadState)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return BookDetailView(service: MockBookService(), bookId: 0)
    }
}

