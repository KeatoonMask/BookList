//
//  Genre.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 18/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

struct Genre: Decodable {
    let id: GenreId
    let name: String
}

enum GenreId: String, Decodable, Hashable {
    case action
    case adventure
    case crime
    case drama
    case fantasy
    case history
    case horror
    case mystery
    case romance
    case scienceFiction

    var description: String {
        switch self {
            case .action: return NSLocalizedString("Action", comment: "Action")
            case .adventure: return NSLocalizedString("Adventure", comment: "Adventure")
            case .crime: return NSLocalizedString("Crime", comment: "Crime")
            case .drama: return NSLocalizedString("Drama", comment: "Drama")
            case .fantasy: return NSLocalizedString("Fantasy", comment: "Fantasy")
            case .history: return NSLocalizedString("History", comment: "History")
            case .horror: return NSLocalizedString("Horror", comment: "Horror")
            case .mystery: return NSLocalizedString("Mystery", comment: "Mystery")
            case .romance: return NSLocalizedString("Romance", comment: "Romance")
            case .scienceFiction: return NSLocalizedString("Science Fiction", comment: "Science Fiction")
        }
    }
}
