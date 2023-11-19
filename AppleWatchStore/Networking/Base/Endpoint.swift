//
//  Endpoint.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var port: Int { get }
}

extension Endpoint {
    var scheme: String { "http" }
    var host: String { "127.0.0.1" }
    var port: Int { 3000 }
}
