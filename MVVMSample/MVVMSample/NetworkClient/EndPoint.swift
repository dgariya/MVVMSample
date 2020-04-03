//
//  EndPoint.swift
//  MVVMSample
//
//  Created by Singh, Dev on 2020/02/03.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import Foundation

struct EndPoint {
    private let path: String
    private let queryItems: [URLQueryItem]?
}

extension EndPoint {
    static func fetch(path servicePath:String,queryItems: [URLQueryItem]?) -> EndPoint {
        return EndPoint(path: servicePath, queryItems: queryItems)
    }
}

extension EndPoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.baseUrl
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
