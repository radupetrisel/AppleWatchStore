//
//  ProductFiltersEndpoint.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

enum ProductFilterEndpoint {
    case all
}

extension ProductFilterEndpoint: Endpoint {
    var path: String {
        switch self {
        case .all:
            return "/product-filters"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .all:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .all:
            return [
                "Content-Type" : "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .all:
            return nil
        }
    }
}
