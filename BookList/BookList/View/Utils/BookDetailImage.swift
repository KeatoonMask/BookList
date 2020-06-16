//
//  BookDetailImage.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 16/06/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

import SwiftUI

struct BookDetailImage: View {
    let image: Image

    var body: some View {
        image
        .resizable()
        .frame(width: 180, height: 280)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray, radius: 10, x: 5, y: 5)
    }
}
