//
//  RequestError.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

enum RequestError: String, Error {
    case decode
    case invalidURL
    case decodable
    case invalidResponse
    case unknown
    
    var description: String {
        switch self {
        case .decode:
            return "Data Parsing Error: Unable to process the received data. Please try again or contact support."
        case .invalidURL:
            return "URL Not Found: The requested URL does not exist. Please verify the URL and ensure it points to a valid resource."
        case .decodable:
            return "Type Mismatch: The data type does not match the expected type. Please check the data and ensure it matches the expected format."
        case .invalidResponse:
            return "Invalid Server Response: The server response is not valid. Please try again later or contact support."
        default:
            return "Server Unreachable: Unable to establish a connection with the server. Please ensure the server is online and try againlater."
        }
    }
}
