import Foundation

enum WeatherIcon: String {
    case brokenClouds = "broken_clouds"
    case clearSky = "clear_sky"
    case cloud = "cloud"
    case fewClouds = "few_clouds"
    case house = "house"
    case mist = "mist"
    case rain = "rain"
    case scatteredClouds = "scattered_clouds"
    case showerRain = "shower_rain"
    case snow = "snow"
    case thunderstorm = "thunderstorm"
    
    static func getIcon(for condition: String) -> WeatherIcon {
        switch condition.lowercased() {
        case _ where condition.contains("clear"):
            return .clearSky
        case _ where condition.contains("few clouds"):
            return .fewClouds
        case _ where condition.contains("scattered"):
            return .scatteredClouds
        case _ where condition.contains("broken"):
            return .brokenClouds
        case _ where condition.contains("shower"):
            return .showerRain
        case _ where condition.contains("rain"):
            return .rain
        case _ where condition.contains("thunderstorm"):
            return .thunderstorm
        case _ where condition.contains("snow"):
            return .snow
        case _ where condition.contains("mist"):
            return .mist
        default:
            return .cloud
        }
    }
} 
