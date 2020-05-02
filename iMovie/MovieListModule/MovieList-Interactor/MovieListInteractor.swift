//
//  MovieListInteractor.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
class MovieListInteractor: PresenterToInteractorMovieListProtocol {
    
    var presenter: InteractorToPresenterMovieListProtocol?
    
    /// This fetches all the popular movies from server or coredata
    /// - Parameter serviceType: serviceType
    func invokePopularMovieListAPI(serviceType: ServiceType) {
        IMNetworkManager.shared.dataManager.fetchMovieDataForType(serviceType:
            serviceType) { (movieList, errorMsg) in
            if errorMsg == nil {
                self.presenter?.popularMovieListAPIInvokeSuccess(movieList: movieList)
            } else {
                self.presenter?.popularMovieListAPIInvokeFailed(errorMsg: errorMsg)
            }
        }
    }
    
    /// This fetches all the top rated movies from server or coredata
    /// - Parameter serviceType: serviceType
    func invokeTopRatedMovieListAPI(serviceType: ServiceType) {
        IMNetworkManager.shared.dataManager.fetchMovieDataForType(serviceType:
            serviceType) { (movieList, errorMsg) in
            if errorMsg == nil {
                self.presenter?.topRatedMovieListAPIInvokeSuccess(movieList: movieList)
            } else {
                self.presenter?.topRatedMovieListAPIInvokeFailed(errorMsg: errorMsg)
            }
        }
    }
    
    /// This fetches all the upcoming movies from server or coredata
    /// - Parameter serviceType: serviceType
    func invokeUpcomingMovieListAPI(serviceType: ServiceType) {
        IMNetworkManager.shared.dataManager.fetchMovieDataForType(serviceType:
            serviceType) { (movieList, errorMsg) in
            if errorMsg == nil {
                self.presenter?.upcomingMovieListAPIInvokeSuccess(movieList: movieList)
            } else {
                self.presenter?.upcomingMovieListAPIInvokeFailed(errorMsg: errorMsg)
            }
        }
    }
    
    /// This saves or updates poster image data into Local storage
    /// - Parameter movie: movie item
    func savePosterImageDataForMovie(movie:Movie) {
        IMCoreDataManager.shared.updateMovieWithImageData(movie:movie)
    }
}
