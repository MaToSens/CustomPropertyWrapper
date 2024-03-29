//
//  FileManager+Extensions.swift
//  CustomPropertyWrapper
//
//  Created by MaTooSens on 09/01/2024.
//

import Foundation

extension FileManager {
    static func documentsPath(key: String) -> URL {
        FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "\(key).txt")
    }
}
