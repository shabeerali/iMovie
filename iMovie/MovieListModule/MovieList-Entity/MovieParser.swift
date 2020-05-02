//
//  MovieParser.swift
//  iMovie
//
//  Created by SHABEERALI K on 29/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation

import CoreData

protocol MovieParserProtocol {
    func parseData(_ data: [String: Any], _ movieType: String)
}

final class MovieParser {

    init() {
        //Add any init code
    }
    
    /// Parsing  movie list
    /// - Parameters:
    ///   - movieList: movieList
    ///   - movieType: movieType 
    func parseMovieList(_ movieList: [String: Any], _ movieType: String)-> [Movie]? {
        let list = MovieList()
        list.parseData(movieList,movieType)
        return list.getMovieList()
    }
}

 
