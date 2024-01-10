//
//  FileManagerCodablePropertyWrapper.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 09/01/2024.
//

import SwiftUI

@propertyWrapper
struct FileManagerCodablePropertyWrapper<T:Codable>: DynamicProperty {
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
    
    init(_ key: String ) {
        self.key = key
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
