//
//  User.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 09/01/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let isPremium: Bool
    
    init (
        id: String = UUID().uuidString,
        name: String,
        isPremium: Bool = false
    ) {
        self.id = id
        self.name = name
        self.isPremium = isPremium
    }
}
