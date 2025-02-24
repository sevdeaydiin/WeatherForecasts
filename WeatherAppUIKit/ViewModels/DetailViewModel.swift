//
//  DetailViewModel.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/24/25.
//

import Foundation
import Combine

final class DetailViewModel {
    private let weatherService: WeatherServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var dailyForecasts: [DailyForecast] = []
    @Published private(set) var error: String?
    @Published private(set) var isLoading = false
    
    private let location: Location
    
    init(
        location: Location,
        weatherService: WeatherServiceProtocol = WeatherService()
    ) {
        self.location = location
        self.weatherService = weatherService
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        isLoading = true
        
        weatherService.fetchDailyForecast(lat: location.coordinates.latitude, lon: location.coordinates.longitude, days: 7)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] forecasts in
                self?.dailyForecasts = forecasts
            }
            .store(in: &cancellables)
    }
    
    var locationName: String {
        if let state = location.state {
            return "\(location.name), \(state), \(location.country)"
        }
        return "\(location.name), \(location.country)"
    }
}
