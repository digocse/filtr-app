//
//  UnsplashManagerTests.swift
//  FiltrTests
//
//  Created by Rodrigo de Sousa Santos on 27/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import XCTest
import SwiftUI
import UnsplashPhotoPicker
@testable import Filtr

class UnsplashManagerTests: XCTestCase {
    func testExample() {
        let placeholderImage = UIImage(named: "bmw")
        let manager = UnsplashManager(searchText: "", image: .constant(placeholderImage))
        
        manager.downloadPhoto(UnsplashPhoto.stubbed(from: "unsplash-photo"))
        
        let exp = expectation(description: "Image has been downloaded")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            // TODO: This test should be improved in order to assure that the manager's image
            // is not the placeholder image
            XCTAssertTrue(manager.image != nil)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
