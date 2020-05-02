//
//  MovieListViewController.swift
//  iMovie
//
//  Created by SHABEERALI K on 26/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    // MARK: Viper Protocols
    /// presenter object for the login view
    var presenter: ViewToPresenterMovieListProtocol?
    
    /// Popular movie list
    var popularMovies : [Movie]?
    /// Top rated movies list
    var topRatedMovies : [Movie]?
    /// Upcoming movies list
    var upcomingMovies : [Movie]?
    
    var errorMsgPopular: String?
    var errorMsgTopRated: String?
    var errorMsgUpcoming: String?
    
    
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie List"
        self.movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCellIdentifier")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

}

// MARK: Presenter To View Protocol Methods
extension MovieListViewController: PresenterToViewMovieListProtocol {
    
    /// This method invoked when  popular movies fetched successfully
    /// - Parameter movieList: movieList
    func popularMovieListFetchSuccess(movieList: [Movie]?) {
        self.popularMovies = movieList
        self.errorMsgPopular = nil
        self.movieTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    /// This method invoked when  TopRated movies fetched successfully
    /// - Parameter movieList: movieList
    func topRatedMovieListFetchSuccess(movieList: [Movie]?) {
        self.topRatedMovies = movieList
        self.errorMsgTopRated = nil
        self.movieTableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: UITableView.RowAnimation.none)
       
    }
    
    /// This method invoked when  Upcoming movies fetched successfully
    /// - Parameter movieList: movieList
    func upcomingMovieListFetchSuccess(movieList: [Movie]?) {
        self.upcomingMovies = movieList
        self.errorMsgUpcoming = nil
        self.movieTableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    /// This method invoked when Popular  movies fetching failed
    /// - Parameter errorMsg: error message
    func popularMovieListFetchFailed(errorMsg: String?) {
        self.popularMovies = nil
        self.errorMsgPopular = errorMsg
        self.movieTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    /// This method invoked when Top Rated movies fetching failed
    /// - Parameter error: error message
    func topRatedMovieListFetchFailed(errorMsg: String?) {
        self.topRatedMovies = nil
        self.errorMsgTopRated = errorMsg
        self.movieTableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    /// This method invoked when Upcoming movies fetching failed
    /// - Parameter errorMsg: error message
    func upcomingMovieListFetchFailed(errorMsg: String?) {
        self.upcomingMovies = nil
        self.errorMsgUpcoming = errorMsg
        self.movieTableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: UITableView.RowAnimation.none)
    }
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCellIdentifier", for: indexPath) as! MovieTableViewCell
        if(indexPath.row == 0) {
            cell.labelCategory.text = ServiceType.popular.rawValue
            cell.movieList = self.popularMovies
            cell.errorMsg = self.errorMsgPopular
            if cell.movieList == nil && cell.errorMsg == nil {
                cell.activityIndicatorView.isHidden = false
                self.presenter?.fetchPopularMovieList(serviceType: .popular)
            } else {
                cell.populateWithData(movieList:self.popularMovies)
            }
        } else if(indexPath.row == 1) {
           
            cell.labelCategory.text = ServiceType.topRated.rawValue
            cell.movieList = self.topRatedMovies
            cell.errorMsg = self.errorMsgTopRated
            if cell.movieList == nil && cell.errorMsg == nil {
                cell.activityIndicatorView.isHidden = false
                self.presenter?.fetchTopRatedMovieList(serviceType: .topRated)
            } else {
                cell.populateWithData(movieList:self.topRatedMovies)
            }
        } else if(indexPath.row == 2) {
            cell.labelCategory.text = ServiceType.upcoming.rawValue
            cell.movieList = self.upcomingMovies
            cell.errorMsg = self.errorMsgUpcoming
            if cell.movieList == nil && cell.errorMsg == nil {
                cell.activityIndicatorView.isHidden = false
                self.presenter?.fetchUpcomingMovieList(serviceType: .upcoming)
            } else {
                cell.populateWithData(movieList:self.upcomingMovies)
            }
       }
       cell.delegate = self
       return cell
   }
}

extension MovieListViewController: MovieTableCellDelegate {
    
    /// This delegate invoked when a movie item is selected
    ///  This method navigates to Move Detail View
    /// - Parameter movie: movie item
    func didSelectMovieItem(movie: Movie?) {
        self.presenter?.gotoMovieDetailView(movie: movie, navController: self.navigationController as? IMNavigationController)
    }
    
    /// This method invoked to save movie poster image tp local storage
    /// - Parameter movie: movie item
    func savePosterImageForMovie(movie: Movie) {
        self.presenter?.savePosterImageDataIntoLocalStorageForMovie(movie: movie)
    }
}

