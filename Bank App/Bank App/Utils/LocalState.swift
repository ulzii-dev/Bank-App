//
//  LocalState.swift
//  Bank App
//
//  Created by Saruululzii on 12/21/23.
//

import Foundation

public class LocalState {
    private enum Keys: String {
        case onboarded
    }
    
    public static var onboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.onboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.setValue(newValue, forKey: Keys.onboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
