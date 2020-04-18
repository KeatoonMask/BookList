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
    var genre: String
    var publisher: String
    var releaseDate: String
    var pagesNumber: Int
    var description: String
    var imageName: String
}

extension BookDetail {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
