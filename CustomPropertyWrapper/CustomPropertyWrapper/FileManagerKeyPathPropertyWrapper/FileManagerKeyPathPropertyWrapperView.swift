//
//  FileManagerKeyPathPropertyWrapperView.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 10/01/2024.
//

import SwiftUI

struct FileManagerKeyPathPropertyWrapperView: View {
    @State private var userName: String = ""
    @State private var userName2: String = ""
    
    @FileManagerKeyPathPropertyWrapper(\.userProfileKeyPath) private var user
    @FileManagerKeyPathPropertyWrapper(\.userProfileKeyPath2) private var user2
    
    var body: some View {
        VStack(spacing: 20) {
            UserSection(userProfile: $user, name: $userName)
            
            UserSection(userProfile: $user2, name: $userName2)
            
            Spacer()
        }
    }
}

#Preview {
    FileManagerKeyPathPropertyWrapperView()
}
