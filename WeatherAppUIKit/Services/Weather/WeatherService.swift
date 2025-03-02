//
//  WeatherService.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/23/25.
//

import Foundation
import Combine

protocol WeatherServiceProtocol {
    func fetchCurrentWeather(for city: String) -> AnyPublisher<WeatherResponse, NetworkError>
    func fetchCurrentWeather(for latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, NetworkError>
}

final class WeatherService: WeatherServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchCurrentWeather(for city: String) -> AnyPublisher<WeatherResponse, NetworkError> {
        let endpoint = Endpoint(
            path: "weather",
            queryItems: [URLQueryItem(name: "q", value: city)]
        )
        
        return networkService.request(endpoint)
    }
    
    func fetchCurrentWeather(for latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, NetworkError> {
        let endpoint = Endpoint(
            path: "weather",
            queryItems: [
                URLQueryItem(name: "lat", value: String(latitude)),
                URLQueryItem(name: "lon", value: String(longitude))
            ]
        )
        
        return networkService.request(endpoint)
    }
}
