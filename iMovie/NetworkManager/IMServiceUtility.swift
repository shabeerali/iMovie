//
//  CommonServiceAPI.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
import UIKit

/// Constants used through out the API call
struct ApiConstant {
    static let appBaseUrl : String  = "http://www.omdbapi.com"
    static let apiKey : String = "469f2462"
}

extension ServiceType {
    /// This return a complete URL for fetching movie data from server based on movie Type
    var url: URL {
        var returnUrl = ""
        switch self {
        case .popular:
            returnUrl = "/?s=pop&type=movie&plot=full"
        case .upcoming:
            returnUrl = "/?s=tre&type=movie&plot=full"
        case .topRated:
            returnUrl = "/?s=bas&type=movie&plot=full"
        }
        return URL(string: (ApiConstant.appBaseUrl + returnUrl+"&apikey=\(ApiConstant.apiKey)").addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? "")!
    }
}

