//
//  MovieListRouter.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
import UIKit
final class MovieListRouter: PresenterToRouterMovieListProtocol {
    
    // MARK: - Properties
    
    /// This returns story board for MovieList Module
    static var movieListStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryBoardNames.movieListModule.rawValue, bundle: Bundle.main)
    }

    // MARK: - Methods
    /// Creates and returns a IMNavigation controller object with MovieListViewController object inside it.
    ///
    /// - Returns: a custom navigation controller
    static func createMovieListModule() -> IMNavigationController {
        let navController = movieListStoryboard.instantiateViewController(withIdentifier: StoryBoardIdentifiers.movieListNavigation.rawValue) as! IMNavigationController
        guard let view = navController.topViewController as? MovieListViewController else {  return IMNavigationController() }
        
        let presenter: ViewToPresenterMovieListProtocol & InteractorToPresenterMovieListProtocol = MovieListPresenter()
        let interactor: PresenterToInteractorMovieListProtocol = MovieListInteractor()
        let router:PresenterToRouterMovieListProtocol = MovieListRouter()
       
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return navController
        
        
    }
    
    /// This method push the MovieDetailView into Navigation Stack
    /// - Parameters:
    ///   - movie: movie item
    ///   - navController: navigation Controller
    func pushToMovieDetaiView(movie: Movie?,navController: IMNavigationController?) {
        let movieDetailView = MovieDetailRouter.createMovieDetailModule()
        movieDetailView.movie = movie
        navController?.pushViewController(movieDetailView, animated: true)
    }
}
