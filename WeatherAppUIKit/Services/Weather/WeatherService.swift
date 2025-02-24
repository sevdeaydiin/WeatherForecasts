//
//  WeatherService.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/23/25.
//

import Foundation
import Combine

protocol WeatherServiceProtocol {
    func fetchHourlyWeather(for city: String) -> AnyPublisher<Weather, NetworkError>
    func fetchWeeklyWeatherForecast(for city: String) -> AnyPublisher<[Weather], NetworkError>
    func fetchHourlyForecast(lat: Double, lon: Double) -> AnyPublisher<[HourlyForecast], NetworkError>
    func fetchDailyForecast(lat: Double, lon: Double, days: Int) -> AnyPublisher<[DailyForecast], NetworkError>
}

final class WeatherService: WeatherServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchHourlyWeather(for city: String) -> AnyPublisher<Weather, NetworkError> {
        let endpoint = Endpoint(
            path: "weather",
            queryItems: [URLQueryItem(name: "q", value: city)]
        )
        
        return networkService.request(endpoint)
    }
    
    func fetchWeeklyWeatherForecast(for city: String) -> AnyPublisher<[Weather], NetworkError> {
        let endpoint = Endpoint(
            path: "forecast/daily",
            queryItems: [URLQueryItem(name: "q", value: city), URLQueryItem(name: "cnt", value: "7")]
        )
        
        return networkService.request(endpoint)
    }
    
    func fetchHourlyForecast(lat: Double, lon: Double) -> AnyPublisher<[HourlyForecast], NetworkError> {
        let endpoint = Endpoint(
            path: "forecast/hourly",
            queryItems: [
                URLQueryItem(name: "lat", value: String(lat)),
                URLQueryItem(name: "lon", value: String(lon))
            ]
        )
        
        return networkService.request(endpoint)
    }
    
    func fetchDailyForecast(lat: Double, lon: Double, days: Int = 7) -> AnyPublisher<[DailyForecast], NetworkError> {
        let endpoint = Endpoint(
            path: "forecast/daily",
            queryItems: [
                URLQueryItem(name: "lat", value: String(lat)),
                URLQueryItem(name: "lon", value: String(lon)),
                URLQueryItem(name: "cnt", value: String(days))
            ]
        )
        
        return networkService.request(endpoint)
    }
}
