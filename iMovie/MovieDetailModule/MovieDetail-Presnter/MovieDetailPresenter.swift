//
//  MovieDetailRouter.swift
//  iMovie
//
//  Created by SHABEERALI K on 02/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
class MovieDetailPresenter: ViewToPresenterMovieDetailProtocol {
    // MARK: Viper Protocols
    var view: PresenterToViewMovieDetailProtocol?
    var interactor: PresenterToInteractorMovieDetailProtocol?
    var router: PresenterToRouterMovieDetailProtocol?
    // MARK: View To Presenter Protocol Methods
    func downloadPosterImageForUrl(url: URL) {
        self.interactor?.invokePosterImageDownloadForUrl(url: url)
    }
}
// MARK: Interactor To Presenter Protocol Methods
extension MovieDetailPresenter: InteractorToPresenterMovieDetailProtocol {
    func posterImageDownloadInvokeFailed(error: String?) {
        self.view?.posterImageDownloadFailed(errorMsg: error)
    }
    
    func posterImageDownloadInvokeSuccess(imgData: Data?) {
        self.view?.posterImageDownloadSuccess(imgData: imgData)
    }
}

