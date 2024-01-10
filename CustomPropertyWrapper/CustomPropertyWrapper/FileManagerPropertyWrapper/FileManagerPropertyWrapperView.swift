//
//  FileManagerPropertyWrapperView.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 09/01/2024.
//

import SwiftUI

struct FileManagerPropertyWrapperView: View {
    @FileManagerPropertyWrapper("custom_title_0") private var title: String = "Button"
    @FileManagerPropertyWrapper("custom_title_1") private var textFieldText: String = "Enter text"
    @FileManagerPropertyWrapper("custom_title_2") private var textFieldText2: String
    
    var body: some View {
        VStack {
            Button(title) { title = "Change title" }
            
            buildTextField($textFieldText)
            
            buildTextField($textFieldText2)
        }
    }
    
    private func buildTextField(_ text: Binding<String>) -> some View {
        TextField("Type here...", text: text)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(radius: 1)
            )
            .padding()
    }
}

#Preview {
    FileManagerPropertyWrapperView()
}
