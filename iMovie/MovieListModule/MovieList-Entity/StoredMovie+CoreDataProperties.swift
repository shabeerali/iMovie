//
//  Movie+CoreDataProperties.swift
//  iMovie
//
//  Created by SHABEERALI K on 01/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//
//

import Foundation
import CoreData


extension StoredMovie {

    @nonobjc public class func movieFetchRequest() -> NSFetchRequest<StoredMovie> {
        return NSFetchRequest<StoredMovie>(entityName: "StoredMovie")
    }

    @NSManaged public var movieId: String?
    @NSManaged public var movieType: String?
    @NSManaged public var poster: String?
    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var posterImage: Data?
}
