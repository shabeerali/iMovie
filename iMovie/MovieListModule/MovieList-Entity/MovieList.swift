//
//  MovieList+CoreDataClass.swift
//  iMovie
//
//  Created by SHABEERALI K on 29/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//
//

import Foundation
import CoreData

public class MovieList: MovieParserProtocol {
    // MARK: - CodingKeys
    public var movieList: Array<Movie> = Array()
    
    enum CodingKeys: String, CodingKey {
        case list
    }
    
    /// This returns movies as an array list
    func getMovieList() -> [Movie]? {
        return movieList
    }
    
    /// Parses the movie list from  server
    /// - Parameters:
    ///   - data: data 
    ///   - movieType: movieType
    func parseData(_ data: [String: Any], _ movieType:String) {
        if let movieList = data[CodingKeys.list.rawValue] as? [[String: Any]] {
            for object in movieList {
                let movie = Movie()
                movie.parseData(object, movieType)
                self.movieList.append(movie)
            }
        }
    }
}

