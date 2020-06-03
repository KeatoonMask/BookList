//
//  BookImage.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 26/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import SwiftUI

struct BookImage: View {
    let image: Image
    
    var body: some View {
        image
        .resizable()
        .frame(width: 70, height: 110)
        .aspectRatio(contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray, radius: 10, x: 5, y: 5)
        .padding()
    }
}

