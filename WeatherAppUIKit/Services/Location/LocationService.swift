//
//  LocationService.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/23/25.
//

import Foundation
import CoreLocation
import Combine

protocol LocationServiceProtocol {
    var currentLocation: AnyPublisher<CLLocation, Error> { get }
    func requestLocationPermission()
    func startUpdatingLocation()
    func stopUpdatingLocation()
}

final class LocationService: NSObject, LocationServiceProtocol {
    private let locationManager: CLLocationManager
    private let locationSubject = PassthroughSubject<CLLocation, Error>()
    
    var currentLocation: AnyPublisher<CLLocation, Error> {
        return locationSubject.eraseToAnyPublisher()
    }
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 1000
    }
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationSubject.send(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationSubject.send(completion: .failure(error))
    }
}
