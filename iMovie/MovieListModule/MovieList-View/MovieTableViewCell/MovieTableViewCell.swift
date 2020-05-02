//
//  MovieTableViewCell.swift
//
//  Created by SHABEERALI K on 29/04/20.
//  Copyright © 2018 SHABEERALI K. All rights reserved.
//

import UIKit
protocol MovieTableCellDelegate: class {
    
    /// This delegate method invoked when movie item has selected
    /// - Parameter movie: movie item
    func didSelectMovieItem(movie: Movie?)
    
    /// This delegate method invoked to save poster image for movie into local storage
    /// - Parameter movie: movie item
    func savePosterImageForMovie(movie: Movie)
}
class MovieTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var movieCollectionVIew: UICollectionView!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var activityIndicatorView: UIView!
    
    /// MovieTableCellDelegate  delegate object
    weak var delegate: MovieTableCellDelegate?
    
    /// a list of movies of particular type
    var movieList : [Movie]?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 130, height: 175)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        movieCollectionVIew.collectionViewLayout = flowLayout
        
        self.movieCollectionVIew.dataSource = self
        self.movieCollectionVIew.delegate = self
        self.movieCollectionVIew.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellIdentifier")
    }
    
    /// This pouplates UI wirh movie list
    /// - Parameter movieList: movieList 
    func populateWithData(movieList:[Movie]?) {
        self.activityIndicatorView.isHidden = true
        self.movieCollectionVIew.isHidden = false
        self.movieCollectionVIew.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellIdentifier", for: indexPath) as! CollectionViewCell
        cell.delegate = self
        cell.populateWithData(movie: self.movieList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectMovieItem(movie: self.movieList?[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 60, height: 175)
    }
}
extension MovieTableViewCell: MovieItemCellDelegate {
    func savePosterImageToLocalStorageForMovie(movie:Movie) {
        self.delegate?.savePosterImageForMovie(movie: movie)
    }
}
