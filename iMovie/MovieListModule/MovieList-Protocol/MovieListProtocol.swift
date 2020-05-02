//
//  MovieListProtocol.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
import UIKit

// MARK: Router - To present the MovieList screen
protocol PresenterToRouterMovieListProtocol: class {
    static func createMovieListModule() -> IMNavigationController
    func pushToMovieDetaiView(movie:Movie?, navController: IMNavigationController?)
}
// MARK: ViewToPresenter - To communicate between view & presenter
protocol ViewToPresenterMovieListProtocol: class {
    /// Properties
    var view: PresenterToViewMovieListProtocol? { get set}
    var interactor: PresenterToInteractorMovieListProtocol? { get set }
    var router: PresenterToRouterMovieListProtocol? { get set }
    /// Methods
    func fetchPopularMovieList(serviceType:ServiceType)
    func fetchTopRatedMovieList(serviceType:ServiceType)
    func fetchUpcomingMovieList(serviceType:ServiceType)
    func gotoMovieDetailView(movie: Movie?, navController: IMNavigationController?)
    func savePosterImageDataIntoLocalStorageForMovie(movie:Movie)
}
// MARK: PresenterToView - To communicate between presenter & view
protocol PresenterToViewMovieListProtocol: class {
    /// Methods
    func popularMovieListFetchSuccess(movieList: [Movie]?)
    func topRatedMovieListFetchSuccess(movieList: [Movie]?)
    func upcomingMovieListFetchSuccess(movieList: [Movie]?)
    func popularMovieListFetchFailed(error: [String : Any]?)
    func topRatedMovieListFetchFailed(error: [String : Any]?)
    func upcomingMovieListFetchFailed(error: [String : Any]?)
}
// MARK: PresenterToInteractor - To communicate between presenter & interactor
protocol PresenterToInteractorMovieListProtocol: class {
    /// Properties
    var presenter: InteractorToPresenterMovieListProtocol? { get set }
    /// Methods
    func invokePopularMovieListAPI(serviceType:ServiceType)
    func invokeTopRatedMovieListAPI(serviceType:ServiceType)
    func invokeUpcomingMovieListAPI(serviceType:ServiceType)
    func savePosterImageDataForMovie(movie:Movie)
}

// MARK: InteractorToPresenter - To communicate between interactor & presenter
protocol InteractorToPresenterMovieListProtocol: class {
    /// Methods
    func popularMovieListAPIInvokeSuccess(movieList: [Movie]?)
    func topRatedMovieListAPIInvokeSuccess(movieList: [Movie]?)
    func upcomingMovieListAPIInvokeSuccess(movieList: [Movie]?)
    func popularMovieListAPIInvokeFailed(error: [String : Any]?)
    func topRatedMovieListAPIInvokeFailed(error: [String : Any]?)
    func upcomingMovieListAPIInvokeFailed(error: [String : Any]?)
}
