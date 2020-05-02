//
//  MovieDetailViewController.swift
//  iMovie
//
//  Created by SHABEERALI K on 02/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    
    /// presenter
    var presenter: ViewToPresenterMovieDetailProtocol?
    
    /// movie item
    var movie: Movie?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var posterContainerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var detailContainerView: UIView!
    @IBOutlet weak var detailTransparentView: UIView!
    @IBOutlet weak var titleTxtView: UITextView!
    @IBOutlet weak var releaseLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Details"
        setupUI()
        populateMovieDetails(movie: self.movie)

        // Do any additional setup after loading the view.
    }
    
    /// Setting up UI elements
    func setupUI() {
        posterContainerView.layer.applySketchShadow()
        posterContainerView.layer.cornerRadius = 8.0
        posterImageView.layer.applySketchShadow()
        posterImageView.layer.cornerRadius = 8.0
        detailContainerView.layer.applySketchShadow()
        detailContainerView.layer.cornerRadius = 8.0
        detailContainerView.backgroundColor = UIColor.black
        detailTransparentView.backgroundColor = UIColor.orange
        detailTransparentView.layer.applySketchShadow()
        detailTransparentView.layer.cornerRadius = 8.0
        detailTransparentView.alpha = 0.2
    }
    
    /// Populating UI with movie details
    /// - Parameter movie: movie
    func populateMovieDetails(movie: Movie?) {
        if let movie = movie {
            if let title = movie.title {
                 self.titleTxtView.text = "\(title)"
            }
            if let releaseYear = movie.year {
                self.releaseLbl.text = "Released On : \(releaseYear)"
            }
            if let imageData = movie.posterImgData {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.posterImageView.image = UIImage(data: imageData)
            } else {
                if let url = movie.poster , let posterUrl = URL(string: url) {
                    self.activityIndicator.startAnimating()
                    self.activityIndicator.isHidden = false
                    self.presenter?.downloadPosterImageForUrl(url: posterUrl)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Presenter To View Protocol Methods
extension MovieDetailViewController: PresenterToViewMovieDetailProtocol {
    
    /// This invoked on poster image downloading succeeded
    /// - Parameter imgData: imgData
    func posterImageDownloadSuccess(imgData: Data?) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            if let imageData = imgData {
                self.posterImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    /// This invoked on poster image download failed
    /// - Parameter errorMsg: errorMsg 
    func posterImageDownloadFailed(errorMsg: String?) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}
