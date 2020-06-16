//
//  BookDetailButton.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 16/06/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookDetailButton: View {

    var text: String
    var buttonColor: Color

    var body: some View {
        HStack {
            Text(text)
                .fontWeight(.semibold)
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(buttonColor)
        .cornerRadius(40)
    }
}
