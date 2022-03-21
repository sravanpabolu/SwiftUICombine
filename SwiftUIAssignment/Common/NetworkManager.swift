//
//  NetworkManager.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    
    func getDataFromNetwork<T: Decodable>(for url: String, type: T.Type) throws -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            throw NetworkError.badUrl
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .mapError{ error in
                NetworkError.custom(description: error.localizedDescription)
            }
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                        200...299 ~= httpResponse.statusCode else {
                    throw NetworkError.badResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main, options: .none)
            .eraseToAnyPublisher()
            
        return publisher
    }
}
