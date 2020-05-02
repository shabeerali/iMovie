//
//  IMCoreDataManager.swift
//  iMovie
//
//  Created by SHABEERALI K on 28/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import CoreData

final class IMCoreDataManager {
    static let shared = IMCoreDataManager()
    
    // setting contextIMovie as view context
    var context: NSManagedObjectContext {
        return persistentIMovieContainer.viewContext
    }
    // MARK: - Core Data stack
    lazy var persistentIMovieContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IMCoreData")
        container.loadPersistentStores(completionHandler: { (_ , error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        return container
    }()
    /**
     *  This creates new background context
     *
     *  @return NSManagedObjectContext : returns an NSManagedObjectContext object
     */
    func newBackgroundContext() -> NSManagedObjectContext {
        let iMovieContext = persistentIMovieContainer.newBackgroundContext()
        iMovieContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        iMovieContext.undoManager = nil
        return iMovieContext
    }

    /**
     *  This perform a saving of Coredata with managed object context
     *
     *  @param context : an NSManagedObjectContext which is to be saved
     *
     *  @return success : returns a success function
     */
    func saveContext(_ context: NSManagedObjectContext, _ success: (() -> Void)? = nil) {
        if context.hasChanges {
            do {
                try context.save()
                success?()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    /**
     *  This perform aving of Coredata  with view context
     */
    func saveContext() {
        saveContext(context)
    }
    
    /// This fetches all movie objects of particular type
    /// - Parameters:
    ///   - serviceType: serviceType defines the type of movie
    ///   - completion: completion with fetched movies
    func getMovieListForType(serviceType:ServiceType, completion:@escaping ([StoredMovie]?) -> ()) {
        let fetchContext = newBackgroundContext()
        let request = StoredMovie.movieFetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "movieType == %@", serviceType.value)
       
        do {
            let fetchResult = try fetchContext.fetch(request)
            completion(fetchResult)
        } catch {
           completion(nil)
        }
        
    }
    
    /// This save the list of movies into Coredata
    /// - Parameter movieList: an array of Movies
    func saveMovieList(movieList:[Movie]?) {
        
        if let movieList = movieList {
            let context = newBackgroundContext()
            //var storedMovieList : [StoredMovie] = []
            for movie in movieList {
                let storedMovie = StoredMovie(context: context)
                storedMovie.copyMovie(movie:movie)
                saveContext(context)
            }
        }
    }
    
    /// This updates Stored movie with poster Image data
    /// - Parameter movie: movie item
    func updateMovieWithImageData(movie:Movie) {
        self.getMovieDetailForMovieId(movie: movie) { (storedMovie, context) in
            if let sMovie = storedMovie, let context = context {
                sMovie.posterImage = movie.posterImgData
                self.saveContext(context)
            }
        }
    }
    
    /// This method fetches a movie item based on movie Id
    /// - Parameters:
    ///   - movie: movie item
    ///   - completion: completion with fetched movie item
    func getMovieDetailForMovieId(movie:Movie, completion:@escaping (StoredMovie?, NSManagedObjectContext?) -> ()) {
        if let movieId = movie.movieId {
            let fetchContext = newBackgroundContext()
            let request = StoredMovie.movieFetchRequest()
            request.returnsObjectsAsFaults = false
            request.predicate = NSPredicate(format: "movieId == %@", movieId)
       
            do {
                let fetchResult = try fetchContext.fetch(request)
                completion(fetchResult.first, fetchContext)
            } catch {
                completion(nil,nil)
            }
        } else {
            completion(nil,nil)
        }
        
    }
    
}
