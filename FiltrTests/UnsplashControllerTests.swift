//
//  UnsplashControllerTests.swift
//  FiltrTests
//
//  Created by Rodrigo de Sousa Santos on 28/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import XCTest
import UnsplashPhotoPicker
@testable import Filtr

class UnsplashControllerTests: XCTestCase {
    let placeholderImageName = "bmw"
    let selectedImageName = "404"
    
    func testMakeCoordinator() {
        let fauxUnsplashManager = FauxUnsplashManager(image: .constant(UIImage(named: selectedImageName)))
        let unsplashController = UnsplashController(searchText: "", image: .constant(UIImage(named: placeholderImageName)), manager: fauxUnsplashManager)
        let coordinator = unsplashController.makeCoordinator()
        
        XCTAssertTrue(coordinator is UnsplashController.Coordinator)
    }
    
    func testManagerSetup() {
        let placeholderImageIdentifier = "bmw-image"
        let selectedImageIdentifier = "404-image"
        let placeholderImage = UIImage(named: placeholderImageName)
        placeholderImage?.accessibilityIdentifier = placeholderImageIdentifier
        let selectedImage = UIImage(named: selectedImageName)
        selectedImage?.accessibilityIdentifier = selectedImageIdentifier
        
        let fauxUnsplashManager = FauxUnsplashManager(image: .constant(selectedImage))
        let stubbedPhoto = UnsplashPhoto.stubbed(from: "unsplash-photo")
        let unsplashController = UnsplashController(searchText: "", image: .constant(UIImage(named: placeholderImageName)), manager: fauxUnsplashManager)
        
        unsplashController.manager.downloadPhoto(stubbedPhoto)
        XCTAssertTrue(fauxUnsplashManager.didCallDownloadPhoto)
        XCTAssertTrue(unsplashController.manager.image?.accessibilityIdentifier == selectedImageIdentifier)
    }
}
