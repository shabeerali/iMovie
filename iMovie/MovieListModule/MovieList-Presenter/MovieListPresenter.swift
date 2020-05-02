//
//  MovieListPresenter.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
class MovieListPresenter: ViewToPresenterMovieListProtocol {

    // MARK: Viper Protocols
    var view: PresenterToViewMovieListProtocol?
    var interactor: PresenterToInteractorMovieListProtocol?
    var router: PresenterToRouterMovieListProtocol?
    
    // MARK: View To Presenter Protocol Methods
    func fetchPopularMovieList(serviceType: ServiceType) {
        self.interactor?.invokePopularMovieListAPI(serviceType: serviceType)
    }
    func fetchTopRatedMovieList(serviceType: ServiceType) {
        self.interactor?.invokeTopRatedMovieListAPI(serviceType: serviceType)
    }
    func fetchUpcomingMovieList(serviceType: ServiceType) {
        self.interactor?.invokeUpcomingMovieListAPI(serviceType: serviceType)
    }
    func gotoMovieDetailView(movie: Movie?, navController: IMNavigationController?) {
        router?.pushToMovieDetaiView(movie: movie, navController: navController)
    }
    func savePosterImageDataIntoLocalStorageForMovie(movie:Movie) {
        self.interactor?.savePosterImageDataForMovie(movie:movie)
    }
}
// MARK: Interactor To Presenter Protocol Methods
extension MovieListPresenter: InteractorToPresenterMovieListProtocol {
    func popularMovieListAPIInvokeSuccess(movieList: [Movie]?) {
        DispatchQueue.main.async {
            self.view?.popularMovieListFetchSuccess(movieList: movieList)
        }
        
    }
    func topRatedMovieListAPIInvokeSuccess(movieList: [Movie]?) {
        DispatchQueue.main.async {
            self.view?.topRatedMovieListFetchSuccess(movieList: movieList)
        }
    }
    func upcomingMovieListAPIInvokeSuccess(movieList: [Movie]?) {
        DispatchQueue.main.async {
            self.view?.upcomingMovieListFetchSuccess(movieList: movieList)
        }
    }
    func popularMovieListAPIInvokeFailed(error: [String : Any]?) {
        
    }
    func topRatedMovieListAPIInvokeFailed(error: [String : Any]?) {
        
    }
    func upcomingMovieListAPIInvokeFailed(error: [String : Any]?) {
    
    }
}

