//
//  TextBindingManager.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 26/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI

class TextBindingManager: ObservableObject {
    let charactersLimit: Int
    
    @Published var text = "" {
        didSet {
            if text.count > charactersLimit && oldValue.count <= charactersLimit {
                text = oldValue
            }
        }
    }
    
    init(limit: Int = 20) {
        charactersLimit = limit
    }
}
