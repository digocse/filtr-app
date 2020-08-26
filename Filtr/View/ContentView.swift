//
//  ContentView.swift
//  Filtr
//
//  Created by Rodrigo de Sousa Santos on 23/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var tapped = false
    @ObservedObject private var searchText = TextBindingManager()
    
    @State private var image = Image("beach")
    @State private var revertIsDisabled = true
    @State private var isShowingUnsplash = false
    
    var body: some View {
        return ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    CustomTextField(placeholder: Text("Faça sua pesquisa").foregroundColor(.white), searchText: $searchText.text)
                    Button(action: {
                        self.tapped = true
                        self.isShowingUnsplash = true
                    }) {
                        Text("Buscar")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }.padding(.horizontal)
                Spacer()
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                HStack {
                    Button(action: {
                        self.image = Image("beach")
                        self.revertIsDisabled = true
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.custom("", size: 22))
                            .foregroundColor(self.revertIsDisabled ? .gray : .white)
                    }.disabled(revertIsDisabled)
                    Spacer()
                    Button(action: {
                        self.applyEffect()
                        self.revertIsDisabled = false
                    }) {
                        Text("Aplicar Efeito")
                            .foregroundColor(self.revertIsDisabled ? .white : .gray)
                            .fontWeight(.bold)
                    }.disabled(!revertIsDisabled)
                }.padding(.horizontal)
            }
        }.sheet(isPresented: $isShowingUnsplash) {
            UnsplashController(searchText: self.searchText.text)
        }
    }
}

extension ContentView {
    private func applyEffect() {
        guard let inputImage = UIImage(named: "beach") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
