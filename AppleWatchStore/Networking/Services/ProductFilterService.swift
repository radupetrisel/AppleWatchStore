//
//  ProductFilterService.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

protocol ProductFilterServiceable {
    func fetchProductFilters() async -> Result<[ProductFilterData], RequestError>
}

struct ProductFilterService: HTTPClient, ProductFilterServiceable {
    func fetchProductFilters() async -> Result<[ProductFilterData], RequestError> {
        return await request(endpoint: ProductFilterEndpoint.all, responseModel: [ProductFilterData].self)
    }
}
