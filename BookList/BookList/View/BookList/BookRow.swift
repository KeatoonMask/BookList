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
            BookImage(image: book.image)
            
            VStack(alignment: .leading) {
                Text(book.title).font(.headline)
                Text("by " + book.author).font(.subheadline).foregroundColor(.gray)
                Spacer().frame(height: 15)
                Text("$" + String(book.price)).font(.title)
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book(id: 0, title: "The Lord of the Rings: The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "fellowship"))
    }
}
