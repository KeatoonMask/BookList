//
//  Genre.swift
//  BookList
//
//  Created by Serafín Ennes Moscoso on 18/04/2020.
//  Copyright © 2020 Serafín Ennes Moscoso. All rights reserved.
//

import Foundation

enum Genre: String, Hashable {
    case action
    case adventure
    case drama
    case fantasy
    case history
    case horror
    case mystery
    case romance
    case scienceFiction
    case present
    case business
    case economics

    var description: String {
        switch self {
            case .action: return NSLocalizedString("Action", comment: "Action")
            case .adventure: return NSLocalizedString("Adventure", comment: "Adventure")
            case .drama: return NSLocalizedString("Drama", comment: "Drama")
            case .fantasy: return NSLocalizedString("Fantasy", comment: "Fantasy")
            case .history: return NSLocalizedString("History", comment: "History")
            case .horror: return NSLocalizedString("Horror", comment: "Horror")
            case .mystery: return NSLocalizedString("Mystery", comment: "Mystery")
            case .romance: return NSLocalizedString("Romance", comment: "Romance")
            case .scienceFiction: return NSLocalizedString("Science Fiction", comment: "Science Fiction")
            case .present: return NSLocalizedString("Present", comment: "Present")
            case .business: return NSLocalizedString("Business", comment: "Business")
            case .economics: return NSLocalizedString("Economics", comment: "Economics")
        }
    }
}
