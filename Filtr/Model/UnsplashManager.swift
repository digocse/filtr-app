//
//  UnsplashManager.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 27/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI
import UnsplashPhotoPicker

protocol UnsplashManagerProtocol {
    var image: UIImage? { get }
    func downloadPhoto(_ photo: UnsplashPhoto)
}

struct UnsplashManager: UnsplashManagerProtocol {
    private let searchText: String
    @Binding var image: UIImage?
    
    private static var cache: URLCache = {
        let memoryCapacity = 50 * 1024 * 1024
        let diskCapacity = 100 * 1024 * 10240
        let diskPath = "unsplash"
        
        return URLCache(
            memoryCapacity: memoryCapacity,
            diskCapacity: diskCapacity,
            directory: URL(fileURLWithPath: diskPath, isDirectory: true)
        )
    }()
    
    init(searchText: String, image selectedImage: Binding<UIImage?>) {
        self.searchText = searchText
        self._image = selectedImage
    }
}

extension UnsplashManager {
    internal func downloadPhoto(_ photo: UnsplashPhoto) {
        guard let url = photo.urls[.regular] else { return }

        if let cachedResponse = UnsplashManager.cache.cachedResponse(for: URLRequest(url: url)),
            let image = UIImage(data: cachedResponse.data) {
            self.image = image
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, let image = UIImage(data: data), error == nil else { return }

            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
