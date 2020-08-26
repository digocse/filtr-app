//
//  AppConfiguration.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 26/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import Foundation

enum ConfigurationKey: String {
    case apiURL = "API_URL"
    case unsplashAccessKey = "UNSPLASH_ACCESS_KEY"
    case unsplashSecretKey = "UNSPLASH_SECRET_KEY"
}

protocol AppConfigurationType {
    var resource: NSDictionary? { get }
    var apiURL: String { get }
    var unsplashAccessKey: String { get }
    var unsplashSecretKey: String { get }
    
    func value<T>(for key: ConfigurationKey) -> T
}

extension AppConfigurationType {
    var apiURL: String {
        return self.value(for: .apiURL)
    }
    
    var unsplashAccessKey: String {
        return self.value(for: .unsplashAccessKey)
    }
    
    var unsplashSecretKey: String {
        return self.value(for: .unsplashSecretKey)
    }
    
    func value<T>(for key: ConfigurationKey) -> T {
        if let apiKey = self.resource?[key.rawValue] as? T {
            return apiKey
        }
        fatalError("Error: no environment dictionary with valid AppConfiguration key found in .plist file.")
    }
}

struct AppConfiguration: AppConfigurationType {
    var resource: NSDictionary?
    
    init(resource: NSDictionary? = Bundle.main.infoDictionary?["AppConfiguration"] as? NSDictionary) {
        self.resource = resource
    }
}
