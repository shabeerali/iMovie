//
//  MovieDetailInteractor.swift
//  iMovie
//
//  Created by SHABEERALI K on 02/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
import UIKit
class MovieDetailInteractor: PresenterToInteractorMovieDetailProtocol {
    var presenter: InteractorToPresenterMovieDetailProtocol?
    var dataTask : URLSessionDataTask?
    var urlSession : URLSession {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        return URLSession.init(configuration: config)
    }
    
    /// This downloads poster image for a movie item
    /// - Parameter url: url for poster image
    func invokePosterImageDownloadForUrl(url: URL) {
        dataTask = urlSession.dataTask( with: url, completionHandler: {
           (data, response, error) -> Void in
           DispatchQueue.main.async {
              if let data = data {
                self.presenter?.posterImageDownloadInvokeSuccess(imgData: data)
              } else {
                self.presenter?.posterImageDownloadInvokeFailed(error: ErrorConstants.customPosterDownloadFailErrorMessage)
              }
           }
        })
        dataTask?.resume()
    }
}

