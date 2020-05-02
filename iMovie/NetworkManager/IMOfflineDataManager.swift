//
//  IMOfflineDataManager.swift
//  iMovie
//
//  Created by SHABEERALI K on 01/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
/// Handles all movie data fetch from CoreData(Offline Data)
class IMOfflineDataManager : IMDataManager {
    
    /// This method fetches all movies from the CoreData(Local Storage) based on the movie type(Service Type)
    /// - Parameters:
    ///   - serviceType: serviceType
    ///   - completion: completion returns a list of movies and error message
    override func fetchMovieDataForType(serviceType:ServiceType,
                                completion:@escaping ([Movie]?, String?) -> ()) {
        
        IMCoreDataManager.shared.getMovieListForType(serviceType: serviceType) { (storedMovieList) in
            if let stMovieList = storedMovieList, stMovieList.count > 0 {
                var movieList : [Movie] = []
                for storedMovie in stMovieList {
                    let movie = Movie()
                    movie.copyStoredMovie(storedMovie: storedMovie)
                    movieList.append(movie)
                }
                completion(movieList,nil)
            } else {
                completion(nil,ErrorConstants.customDBErrorMessage)
            }
        }
        
    }
}
