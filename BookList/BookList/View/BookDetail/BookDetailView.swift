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
        VStack {
            VStack {
                viewModel.bookDetail.image
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                    .padding(.bottom, 15)


                Text(viewModel.bookDetail.author)
                    .foregroundColor(.gray)
                    .padding(.bottom)

                Text(viewModel.bookDetail.title)
                    .font(.system(size: 24, weight: .semibold))
            }

            Spacer()
                .frame(height: 20)

            Text(viewModel.bookDetail.description)
            .padding(20)
            .lineLimit(4)
            .lineSpacing(10)
                .foregroundColor(.gray)

            HStack(spacing: 20) {
                BookDetailLabelView(text: "Novel")
                ForEach(0 ..< viewModel.bookDetail.genre.count, id: \.self) { index in
                    BookDetailLabelView(text: self.viewModel.bookDetail.genre[index].description)

                }
            }

            Divider().padding()

            Button(action: {
                print("Delete tapped!")
            }) {
                HStack {
                    Text("Buy for 18.85$")
                        .fontWeight(.semibold)
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(40)
            }
        }.navigationBarItems(trailing:
            Button(action: {
                
            }) {
                Image("iconWishlist").foregroundColor(.black)
            }
        )
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return BookDetailView(bookId: 0)
    }
}

