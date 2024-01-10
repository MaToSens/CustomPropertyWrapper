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
