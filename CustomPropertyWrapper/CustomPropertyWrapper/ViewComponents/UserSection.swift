//
//  UserSection.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 10/01/2024.
//

import SwiftUI

struct UserSection: View {
    @Binding var userProfile: User?
    @Binding var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            buildUserSection()
            
            buildTextFieldSection()
            
            Divider()
        }
        .padding(.horizontal)
    }
    
    private func buildUserSection() -> some View {
        HStack {
            Text("User name: \(userProfile?.name ?? "N/A")")
            Spacer()
            Button("Save") { userProfile = User(name: name) }
        }
    }
    
    private func buildTextFieldSection() -> some View {
        TextField("My name is:", text: $name)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(radius: 1)
            )
    }
}
