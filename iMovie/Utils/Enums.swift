//
//  Enums.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation

/// StoryBoard Names
enum StoryBoardNames: String {
    case movieListModule = "MovieList"
    case movieDetailModule = "MovieDetail"
}

/// StoryBoard Identifiers
enum StoryBoardIdentifiers: String {
    case movieListviewController = "movieListViewController"
    case movieListNavigation = "movieListNavigation"
    case movieDetailviewController = "movieDetailviewController"
}

/// Service Type refers to type or genre of movies
enum ServiceType : String {
    case popular = "Popular"
    case topRated = "TopRated"
    case upcoming = "Upcoming"
}

extension ServiceType {
    /// This returns currensponding  string value for Movie Type
    var value : String {
        switch self {
        case .popular:
            return "Popular"
        case .topRated:
            return "TopRated"
        case .upcoming:
            return "Upcoming"
        }
    }
}
