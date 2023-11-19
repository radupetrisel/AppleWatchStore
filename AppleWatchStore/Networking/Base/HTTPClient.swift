//
//  HttpClient.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 19.11.2023.
//

import Foundation

protocol HTTPClient {
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.path = endpoint.path
        urlComponents.port = endpoint.port
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodeReponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decodable)
                }
                
                return .success(decodeReponse)
            case 401:
                return .failure(.invalidResponse)
            default:
                return .failure(.invalidResponse)
            }
        } catch {
            return .failure(.invalidURL)
        }
    }
}
