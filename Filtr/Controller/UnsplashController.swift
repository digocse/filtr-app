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
    internal var manager: UnsplashManagerProtocol = UnsplashManager(searchText: "",
                                                                    image: .constant(UIImage(named: "bmw")))
    
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
    
    init(searchText: String, image selectedImage: Binding<UIImage?>, manager: UnsplashManagerProtocol) {
        self.searchText = searchText
        self._image = selectedImage
        self.manager = manager
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UnsplashController>) -> UnsplashPhotoPicker {
        let configuration = UnsplashPhotoPickerConfiguration(
            accessKey: self.appConfiguration.unsplashAccessKey,
            secretKey: self.appConfiguration.unsplashSecretKey,
            query: self.searchText)
        
        let unsplashPhotoPickerController = UnsplashPhotoPicker(configuration: configuration)
        
        unsplashPhotoPickerController.photoPickerDelegate = context.coordinator
        return unsplashPhotoPickerController
    }
    
    func updateUIViewController(_ uiViewController: UnsplashPhotoPicker, context: UIViewControllerRepresentableContext<UnsplashController>) { }
}
