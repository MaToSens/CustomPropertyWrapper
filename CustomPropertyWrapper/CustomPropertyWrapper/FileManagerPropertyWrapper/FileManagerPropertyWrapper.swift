//
//  FileManagerPropertyWrapper.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 09/01/2024.
//

import SwiftUI

@propertyWrapper
struct FileManagerPropertyWrapper: DynamicProperty {
    @State private var title: String
    private let key: String
    
    var wrappedValue: String {
        get { title }
        nonmutating set { save(newValue) }
    }
    
    var projectedValue: Binding<String> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    init(wrappedValue: String = "", _ key: String ) {
        self.key = key
        self.title = ""
        self.title = loadInitialValue(wrappedValue)
    }
    
    private func save(_ newValue: String) {
        do {
            let url = FileManager.documentsPath(key: key)
            try newValue.write(to: url, atomically: false, encoding: .utf8)
            
            title = newValue
        } catch {
            print("Error saving: ", error.localizedDescription)
        }
    }
    
    private func loadInitialValue(_ defaultValue: String) -> String {
        do {
            let url = FileManager.documentsPath(key: key)
            return try String(contentsOf: url, encoding: .utf8)
        } catch {
            print("Error reading: ", error.localizedDescription)
            return defaultValue
        }
    }
}
