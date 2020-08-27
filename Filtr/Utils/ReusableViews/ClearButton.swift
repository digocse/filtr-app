//
//  ClearButton.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 26/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(.white)
                }.padding(.trailing, 48)
            }
        }
    }
}
