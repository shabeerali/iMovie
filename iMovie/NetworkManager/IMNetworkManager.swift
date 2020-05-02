//
//  NetworkManager.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation

/// This class handles connectivity and routing of data fetching
class IMNetworkManager {
    static var shared = IMNetworkManager()
    /// This onlineDataManager handles all data fetch from server
    var onlineDataManager = IMOnlineDataManager()
    /// This offlineDataManager handles all data fetch from CoreData
    var offlineDataManager = IMOfflineDataManager()
    /// dataManager is a Base class object
    var dataManager : IMDataManager {
        if Reachability.isConnectedToNetwork() {
            return onlineDataManager
        } else {
            return offlineDataManager
        }
    }
}

