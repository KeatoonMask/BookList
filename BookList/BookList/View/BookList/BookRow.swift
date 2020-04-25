//
//  BookRow.swift
//  BookList
//
//  Created by Finsi Ennes≈ on 15/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookRow: View {
    let book: Book

    var body: some View {
        HStack {
            book.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 10, x: 5, y: 5)
            .padding()
            
            VStack(alignment: .leading) {
                Text(book.title).font(.headline)
                Text("by " + book.author).font(.subheadline).foregroundColor(.gray)
                Spacer().frame(height: 15)
                Text("18.85$").font(.title)
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book(id: 1, title: "The Lord of the Rings: The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "fellowship"))
    }
}
