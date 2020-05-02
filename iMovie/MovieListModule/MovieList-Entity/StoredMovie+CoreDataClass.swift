//
//  Movie+CoreDataClass.swift
//  iMovie
//
//  Created by SHABEERALI K on 01/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//
//

import Foundation
import CoreData


public class StoredMovie: NSManagedObject {
    
    /// This copies values form Movie obejct to StoredMovie object
    /// - Parameter movie: Movie object
    func copyMovie(movie:Movie) {
        self.movieId        =   movie.movieId
        self.movieType      =   movie.movieType
        self.poster         =   movie.poster
        self.title          =   movie.title
        self.year           =   movie.year
        self.posterImage    =   movie.posterImgData
    }
}
