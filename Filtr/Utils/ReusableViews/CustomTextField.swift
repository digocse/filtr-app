//
//  CustomTextField.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 26/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    @Binding var searchText: String
    var editingChanged: (Bool) -> () = { _ in }
    var commit: () -> () = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if searchText.isEmpty { placeholder }
            TextField("", text: $searchText, onEditingChanged: editingChanged, onCommit: commit)
                .foregroundColor(.white)
                .modifier(ClearButton(text: $searchText))
        }
    }
}
