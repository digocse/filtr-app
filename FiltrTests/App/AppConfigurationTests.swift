//
//  AppConfigurationTests.swift
//  FiltrTests
//
//  Created by Rodrigo de Sousa Santos on 29/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import XCTest
@testable import Filtr

class AppConfigurationTests: XCTestCase {
    var resource: NSDictionary!
    var appConfiguration: AppConfiguration!
    
    override func setUp() {
        resource = Bundle.main.infoDictionary?["AppConfiguration"] as? NSDictionary
        appConfiguration = AppConfiguration(resource: resource)
    }
    
    func testSetupResources() {
        XCTAssertEqual(resource, appConfiguration.resource)
    }
    
    func testSetupEndpointUrl() {
        let endpoint: String = appConfiguration.value(for: ConfigurationKey.apiURL)
        XCTAssertEqual(endpoint, appConfiguration.apiURL)
    }
    
    func testSetupUnsplashAccessKey() {
        let unsplashAccessKey: String = appConfiguration.value(for: ConfigurationKey.unsplashAccessKey)
        XCTAssertEqual(unsplashAccessKey, appConfiguration.unsplashAccessKey)
    }
    
    func testSetupUnsplashSecretKey() {
        let unsplashSecretKey: String = appConfiguration.value(for: ConfigurationKey.unsplashSecretKey)
        XCTAssertEqual(unsplashSecretKey, appConfiguration.unsplashSecretKey)
    }
}
