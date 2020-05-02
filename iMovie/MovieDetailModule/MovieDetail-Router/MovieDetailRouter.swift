//
//  MovieDetailRouter.swift
//  iMovie
//
//  Created by SHABEERALI K on 02/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
import UIKit
final class MovieDetailRouter: PresenterToRouterMovieDetailProtocol {

    // MARK: - Properties
    static var movieDetailStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryBoardNames.movieDetailModule.rawValue, bundle: Bundle.main)
    }

    // MARK: - Methods
    /// Creates and returns a movie detail view controller.
    ///
    /// - Returns: view controller for MovieDetailViewController
    static func createMovieDetailModule() -> MovieDetailViewController {
        guard let view = movieDetailStoryboard.instantiateViewController(withIdentifier: StoryBoardIdentifiers.movieDetailviewController.rawValue)
            as? MovieDetailViewController else {
                return BaseViewController() as! MovieDetailViewController
        }
        
        let presenter: ViewToPresenterMovieDetailProtocol & InteractorToPresenterMovieDetailProtocol = MovieDetailPresenter()
        let interactor: PresenterToInteractorMovieDetailProtocol = MovieDetailInteractor()
        let router:PresenterToRouterMovieDetailProtocol = MovieDetailRouter()
       
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
