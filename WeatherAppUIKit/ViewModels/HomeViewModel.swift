//
//  HomeViewModel.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/24/25.
//

import Foundation
import Combine
import CoreLocation

final class HomeViewModel {
    private let weatherService: WeatherServiceProtocol
    private let locationService: LocationServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var hourlyForecasts: [HourlyForecast] = []
    @Published private(set) var currentLocation: Location?
    @Published private(set) var error: String?
    @Published private(set) var isLoading = false
    
    init(
        weatherService: WeatherServiceProtocol = WeatherService(),
         locationService: LocationServiceProtocol = LocationService()
    ) {
        self.weatherService = weatherService
        self.locationService = locationService
        setupLocationSubscription()
    }
    
    private func setupLocationSubscription() {
        locationService.currentLocation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] location in
                self?.fetchWeatherForLocation(latitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude)
            }
            .store(in: &cancellables)
    }
    
    func requestLocationPermission() {
        locationService.requestLocationPermission()
    }
    
    func startLocationUpdates() {
        locationService.startUpdatingLocation()
    }
    
    func fetchWeatherForLocation(latitude: Double, longitude: Double) {
        isLoading = true
        
        weatherService.fetchHourlyForecast(lat: latitude, lon: longitude)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] forecasts in
                self?.hourlyForecasts = forecasts
            }
            .store(in: &cancellables)
    }
    
    func fetchWeatherForSearchedLocation(_ location: Location) {
        fetchWeatherForLocation(latitude: location.coordinates.latitude,
                                longitude: location.coordinates.longitude)
    }
}
