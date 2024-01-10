//
//  FileManagerKeyPathPropertyWrapper.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 10/01/2024.
//

import SwiftUI

struct FileManagerValues {
    static let shared = FileManagerValues()
    private init() { }
    
    let userProfileKeyPath = FileManagerKeyPath(key: "user_profile_key_path", type: User.self)
    let userProfileKeyPath2 = FileManagerKeyPath(key: "user_profile_key_path", type: User.self)
}

struct FileManagerKeyPath<T:Codable> {
    let key: String
    let type: T.Type
}

@propertyWrapper
struct FileManagerKeyPathPropertyWrapper<T:Codable>: DynamicProperty {
    @State private var value: T?
    private let key: String
    
    var wrappedValue: T? {
        get { value }
        nonmutating set { save(newValue) }
    }
    
    var projectedValue: Binding<T?> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    init(_ key: KeyPath<FileManagerValues, FileManagerKeyPath<T>>) {
        let keyPath = FileManagerValues.shared[keyPath: key]
        
        self.key = keyPath.key
        self._value = State(wrappedValue: loadInitialValue())
    }
    
    private func save(_ newValue: T?) {
        do {
            let url = FileManager.documentsPath(key: key)
            let data = try JSONEncoder().encode(newValue)
            try data.write(to: url)

            value = newValue
        } catch {
            print("Error saving: ", error.localizedDescription)
        }
    }
    
    private func loadInitialValue() -> T? {
        do {
            let url = FileManager.documentsPath(key: key)
            let data = try Data(contentsOf: url)
            let object = try JSONDecoder().decode(T.self, from: data)
            
            return object
        } catch {
            print("Error reading: ", error.localizedDescription)
            return nil
        }
    }
}
