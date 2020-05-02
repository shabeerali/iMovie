//
//  CollectionViewCell.swift
//  ColllectionViewSample
//
//  Created by SHABEERALI K on 29/04/20.
//  Copyright © 2018 SHABEERALI K. All rights reserved.
//

import UIKit
protocol MovieItemCellDelegate: class {
    
    /// Save poster image data into local storage
    /// - Parameter movie: movie
    func savePosterImageToLocalStorageForMovie(movie:Movie)
}
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /// MovieItemCellDelegate delegate object
    weak var delegate : MovieItemCellDelegate?
    var dataTask : URLSessionDataTask?
    var urlSession : URLSession {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        return URLSession.init(configuration: config)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    override func prepareForReuse() {
        dataTask?.cancel()
        self.imageView.image = nil
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.avatarImageView.isHidden = false
    }
    
    /// This populates UI with movie details
    /// - Parameter movie: movie item
    func populateWithData(movie: Movie?) {
        if let movieData = movie {
            if let posterImageData = movieData.posterImgData {
                self.imageView.isHidden = false
                self.avatarImageView.isHidden = true
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.imageView.image = UIImage(data: posterImageData)
            } else if let posterUrl = movieData.poster {
                self.setImageFromUrl(ImageURL: posterUrl, movie: movieData)
            }
        }
    }
    
    /// This downloads and sets poster image for movie item
    /// - Parameters:
    ///   - ImageURL: ImageURL for poster image
    ///   - movie: movie item
    func setImageFromUrl(ImageURL :String, movie: Movie) {
       self.activityIndicator.startAnimating()
       self.activityIndicator.isHidden = false
        dataTask = urlSession.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.imageView.image = UIImage(data: data)
                movie.posterImgData = data
                self.delegate?.savePosterImageToLocalStorageForMovie(movie: movie)
                self.imageView.isHidden = false
                self.avatarImageView.isHidden = true
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
             } else {
                self.avatarImageView.isHidden = false
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
             }
          }
       })
       dataTask?.resume()
    }
}
