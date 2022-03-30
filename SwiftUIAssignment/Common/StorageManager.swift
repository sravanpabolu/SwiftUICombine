//
//  StorageManager.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 24/03/22.
//

import Foundation

protocol StorageRules {
    func saveData<T>(for key: String, value: T)
    func getData<T: Decodable>(for key: String, type: T.Type) -> T?
}

class StorageManager: StorageRules {
    static let shared = StorageManager()
    
    func saveData<T>(for key: String, value: T) {
        debugPrint("saveData - \(key) - \(value)")
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func getData<T>(for key: String, type: T.Type) -> T? {
        debugPrint("Value - \(String(describing: UserDefaults.standard.value(forKey: key)))")
        guard let value = UserDefaults.standard.value(forKey: key) as? T else {
            return nil
        }
        return value
    }
}
