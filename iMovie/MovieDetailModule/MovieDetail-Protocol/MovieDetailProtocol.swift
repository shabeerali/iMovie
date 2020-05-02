//
//  MovieDetailProtocol.swift
//  iMovie
//
//  Created by SHABEERALI K on 02/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation

import UIKit

// MARK: Router - To present the MovieDetail screen
protocol PresenterToRouterMovieDetailProtocol: class {
    //static func createMovieDetailModule() -> MovieDetailViewContoller
}
// MARK: ViewToPresenter - To communicate between view & presenter
protocol ViewToPresenterMovieDetailProtocol: class {
    /// Properties
    var view: PresenterToViewMovieDetailProtocol? { get set}
    var interactor: PresenterToInteractorMovieDetailProtocol? { get set }
    var router: PresenterToRouterMovieDetailProtocol? { get set }
    /// Methods
    func downloadPosterImageForUrl(url: URL)

}
// MARK: PresenterToView - To communicate between presenter & view
protocol PresenterToViewMovieDetailProtocol: class {
    /// Methods
    func posterImageDownloadSuccess(imgData: Data?)
    func posterImageDownloadFailed(errorMsg: String?)

}
// MARK: PresenterToInteractor - To communicate between presenter & interactor
protocol PresenterToInteractorMovieDetailProtocol: class {
    /// Properties
    var presenter: InteractorToPresenterMovieDetailProtocol? { get set }
    /// Methods
    func invokePosterImageDownloadForUrl(url: URL)
}

// MARK: InteractorToPresenter - To communicate between interactor & presenter
protocol InteractorToPresenterMovieDetailProtocol: class {
    /// Methods
    func posterImageDownloadInvokeSuccess(imgData: Data?)
    func posterImageDownloadInvokeFailed(error: String?)
}
