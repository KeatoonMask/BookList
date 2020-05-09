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
}

struct BookDetailView: View {

    @ObservedObject
    var viewModel: AnyViewModel<BookDetailState, BookDetailInput>

    @State private var showModal = false

    init(service: BookService, bookId: Int) {
        self.viewModel = AnyViewModel(BookDetailViewModel(service: service, id: bookId))
    }

    var body: some View {
        VStack {
            VStack {
                viewModel.bookDetail.image
                .resizable()
                .frame(width: 180, height: 280)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 10, x: 5, y: 5)

                Spacer()
                .frame(height: 20)

                Text(viewModel.bookDetail.author)
                    .foregroundColor(.gray)
                    .padding(.bottom)

                Text(viewModel.bookDetail.title)
                    .font(.system(size: 24, weight: .semibold))
                    .padding([.leading, .trailing], 20)
            }

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
                    BookDetailLabelView(text: self.viewModel.bookDetail.genre[index].description)

                }
                BookDetailLabelView(text: viewModel.bookDetail.kind)
            }

            Divider().padding()

            Button(action: addToCart) {
                HStack {
                    Text("Buy for " + String(viewModel.bookDetail.price) + "$")
                        .fontWeight(.semibold)
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(40)
            }

            Spacer()
            .frame(height: 10)
        }.navigationBarItems(trailing:


            Button(action: {
                self.showModal = true
            }) {
                CartButtonView(numberOfItems: self.viewModel.cartItems)
            }.sheet(isPresented: self.$showModal) {
                CartView(service: self.viewModel.state.service)
            }
        )
    }
}

private extension BookDetailView {
    func addToCart() {
        viewModel.trigger(.addBookToCart)
    }
}


struct ModalView: View {

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    Group {
      Text("Modal view")
      Button(action: {
         self.presentationMode.wrappedValue.dismiss()
      }) {
        Text("Dismiss")
      }
    }
  }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return BookDetailView(service: MockBookService(), bookId: 0)
    }
}

