//
//  DataManager.swift
//  iMovie
//
//  Created by SHABEERALI K on 01/05/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation

/// Base class for  data fetching
class IMDataManager {
    
    func fetchMovieDataForType(serviceType:ServiceType, completion:@escaping ([Movie]?, String?) -> ()) {}
}
