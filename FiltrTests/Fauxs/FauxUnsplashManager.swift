//
//  FauxUnsplashManager.swift
//  FiltrTests
//
//  Created by Rodrigo de Sousa Santos on 29/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI
import UnsplashPhotoPicker
@testable import Filtr

final class FauxUnsplashManager: UnsplashManagerProtocol {
    @Binding var image: UIImage?
    
    var didCallDownloadPhoto = false
    
    init(image: Binding<UIImage?>) {
        self._image = image
    }
    
    func downloadPhoto(_ photo: UnsplashPhoto) {
        self.didCallDownloadPhoto = true
    }
}
