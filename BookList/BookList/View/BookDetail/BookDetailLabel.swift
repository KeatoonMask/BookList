//
//  BookDetailLabelView.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 19/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookDetailLabel: View {

    var text: String

    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct BookDetailLabelView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailLabel(text: "Fantasy")
    }
}
