//
//  UserDefaultsManager.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    private enum Keys {
        static let firstLaunch = "firstLaunch"
    }
    
    var isFirstLaunch: Bool {
        get { defaults.bool(forKey: Keys.firstLaunch) || !defaults.hasKey(Keys.firstLaunch) }
        set { defaults.set(newValue, forKey: Keys.firstLaunch) }
    }
}

private extension UserDefaults {
    func hasKey(_ key: String) -> Bool {
        return object(forKey: key) != nil
    }
}
