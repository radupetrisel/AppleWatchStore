//
//  ProductService.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

protocol ProductServiceable {
    func fetchProducts() async -> Result<[ProductData], RequestError>
}

struct ProductService: HTTPClient, ProductServiceable {
    func fetchProducts() async -> Result<[ProductData], RequestError> {
        return await request(endpoint: ProductEndpoint.all, responseModel: [ProductData].self)
    }
}
