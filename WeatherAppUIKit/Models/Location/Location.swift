//
//  Location.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import Foundation
import CoreLocation

struct Location: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let country: String
    let state: String?
    let coordinates: LocationCoordinates
    let timezone: String
    var isFavorite: Bool
    let lastUpdated: Date

    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}

struct LocationCoordinates: Codable, Equatable {
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct LocationSearchResult: Codable {
    let name: String
    let country: String
    let state: String?
    let coordinates: LocationCoordinates
    
    func toLocation() -> Location {
        Location(
            id: "\(coordinates.latitude),\(coordinates.longitude)",
            name: name,
            country: country,
            state: state,
            coordinates: coordinates,
            timezone: TimeZone.current.identifier,
            isFavorite: false,
            lastUpdated: Date()
        )
    }
}
