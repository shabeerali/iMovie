//
//  IMOnlineDataManager.swift
//  iMovie
//
//  Created by SHABEERALI K on 01/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

/// Handles all movie data fetch from server
class IMOnlineDataManager : IMDataManager {
    
    static var shared = IMOnlineDataManager()
    
    /// Shared URL  Session
    var urlSession = URLSession.shared
    
    /// This method fetches all movies from the server based on the movie type(Service Type)
    /// - Parameters:
    ///   - serviceType: serviceType (Movie type)
    ///   - completion: completion returns a list of movies and error message
    override func fetchMovieDataForType(serviceType:ServiceType,
                                        completion:@escaping ([Movie]?, String?) -> ()) {
        let request = URLRequest(url: serviceType.url)
        let task = urlSession.dataTask(with: request, completionHandler: {
          (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    throw JSONError.ConversionFailed
                }
                if let movieList = json["Search"] as? [[String:Any]] {
                    let movieListDict = ["list": movieList]
                    let parser = MovieParser()
                    let movieListArray = parser.parseMovieList(movieListDict,serviceType.value)
                    IMCoreDataManager.shared.saveMovieList(movieList:movieListArray)
                    completion(movieListArray, nil)
                } else {
                    completion(nil, ErrorConstants.customErrorMessage)
                }
                
            } catch {
                completion(nil, ErrorConstants.customErrorMessage)
            } 
          
          // this is where the completion handler code goes
        })
        task.resume()
    }
}
