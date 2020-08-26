//
//  UnsplashController.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 26/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI
import UnsplashPhotoPicker

struct UnsplashController:  UIViewControllerRepresentable {
    private let appConfiguration = AppConfiguration()
    private let searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UnsplashController>) -> UIViewController {
        let configuration = UnsplashPhotoPickerConfiguration(
        accessKey: self.appConfiguration.unsplashAccessKey,
        secretKey: self.appConfiguration.unsplashSecretKey,
        query: self.searchText)
        let unsplashController = UnsplashPhotoPicker(configuration: configuration)
        return unsplashController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<UnsplashController>) {
        
    }
}
