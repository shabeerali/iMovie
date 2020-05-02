//
//  Movie.swift
//  iMovie
//
//  Created by SHABEERALI K on 28/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//
//

import Foundation
import CoreData

public class Movie: MovieParserProtocol {
    public var title: String?
    public var year: String?
    public var poster: String?
    public var movieId: String?
    public var movieType: String?
    public var posterImgData: Data?
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case movieId = "imdbID"
        case poster = "Poster"
        case movieType
    }
    
    // MARK: - Methods
    
    /// Method to parse data into the properties from sender
    ///
    /// - Parameter data: data in JSON format
    func parseData(_ data: [String: Any], _ movieType: String) {
        self.title = data[CodingKeys.title.rawValue] as? String
        self.year = data[CodingKeys.year.rawValue] as? String
        self.movieType = movieType
        self.poster = data[CodingKeys.poster.rawValue] as? String
        self.movieId = data[CodingKeys.movieId.rawValue] as? String
    }
    
    /// This copies values form StoredMovie obejct to Movie object
    /// - Parameter movie: StoredMovie object
    func copyStoredMovie(storedMovie:StoredMovie) {
        self.movieId        =   storedMovie.movieId
        self.movieType      =   storedMovie.movieType
        self.poster         =   storedMovie.poster
        self.title          =   storedMovie.title
        self.year           =   storedMovie.year
        self.posterImgData  = storedMovie.posterImage
    }
}
