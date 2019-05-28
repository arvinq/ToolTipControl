//
//  URL+Helper.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/26/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation

extension URL {
    
    /**
     Helper method to compose url based on the query items present
     - Parameter items: potential query items. Please refer to AppProperty for the list of current query items
     */
    func withQuery(items : [String: String]) -> URL? {
        var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
        component?.queryItems = items.compactMap {
            return URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return component?.url
    }
}
