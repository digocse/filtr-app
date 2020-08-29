//
//  FauxUnsplashPhoto.swift
//  FiltrTests
//
//  Created by Rodrigo de Sousa Santos on 27/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import UnsplashPhotoPicker

extension UnsplashPhoto {
    public static func stubbed(from filename: String) -> Self {
        let data = Stub.response(from: filename)
        return try! JSONDecoder().decode(Self.self, from: data)
    }
}
