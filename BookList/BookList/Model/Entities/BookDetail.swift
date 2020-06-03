//
//  BookDetail.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 15/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation
import SwiftUI

struct BookDetail {
    var id: String
    var bookId: Int
    var author: String
    var title: String
    var price: Double
    var genre: [Genre]
    var kind: String
    var description: String
    var imageName: String
    var isAvailable: Bool
}

extension BookDetail {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
