//
//  CartRow.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 26/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct CartRow: View {
    var item: Item

    var body: some View {
        HStack {
            BookImage(image: item.item.image)

            VStack(alignment: .leading) {
                Text(item.item.title)
                Spacer().frame(height: 15)
                Text("$" + String(item.item.price)).font(.system(size: 18)).bold()
            }.padding([.top, .bottom])
                .frame(width: 150)

            BookDetailLabel(text: "x" + String(item.units))
                .padding(.leading, 20)
        }
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        let book = Book(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "fellowship")
        let item = Item(id: "0", item: book, units: 2)
        return CartRow(item: item)
    }
}
