//
//  FileManagerCodablePropertyWrapperView.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 09/01/2024.
//

import SwiftUI

struct FileManagerCodablePropertyWrapperView: View {
    @State private var userName: String = ""
    @State private var userName2: String = ""
    
    @FileManagerCodablePropertyWrapper("user_profile") private var user: User?
    @FileManagerCodablePropertyWrapper("user_profile_2") private var user2: User?
    
    var body: some View {
        VStack(spacing: 20) {
            UserSection(userProfile: $user, name: $userName)
            
            UserSection(userProfile: $user2, name: $userName2)
            
            Spacer()
        }
    }
}

#Preview {
    FileManagerCodablePropertyWrapperView()
}

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
