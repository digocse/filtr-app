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
    private let manager: UnsplashManager
    
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, UnsplashPhotoPickerDelegate, UINavigationControllerDelegate {
        var parent: UnsplashController
        
        init(_ parent: UnsplashController) {
            self.parent = parent
        }
        
        func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]) {
            guard let photo = photos.first else { return }
            parent.manager.downloadPhoto(photo)
        }
        
        func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker) { }
    }
    
    init(searchText: String, image selectedImage: Binding<UIImage?>) {
        self.searchText = searchText
        self._image = selectedImage
        self.manager = UnsplashManager(searchText: self.searchText, image: self._image)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UnsplashController>) -> UnsplashPhotoPicker {
        let configuration = UnsplashPhotoPickerConfiguration(
            accessKey: self.appConfiguration.unsplashAccessKey,
            secretKey: self.appConfiguration.unsplashSecretKey,
            query: self.searchText)
        
        let unsplashController = UnsplashPhotoPicker(configuration: configuration)
        
        unsplashController.photoPickerDelegate = context.coordinator
        return unsplashController
    }
    
    func updateUIViewController(_ uiViewController: UnsplashPhotoPicker, context: UIViewControllerRepresentableContext<UnsplashController>) { }
}
