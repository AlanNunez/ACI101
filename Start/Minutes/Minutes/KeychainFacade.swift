//
//  KeychainFacade.swift
//  Minutes
//
//  Created by Desarrollo on 5/8/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import Foundation
import Security

class KeychainFacade {
    
    public enum KeychainFacadeError: Error {
        case invalidContent
        case failure(status: OSStatus)
    }
    private func setupQueryDictionary(forKey key: String) -> [String: Any] {
        var queryDictionary: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        queryDictionary[kSecAttrAccount as String] = key.data(using: .utf8)
        return queryDictionary
    }
    
    public func set(string: String, forKey key: String) throws {
        guard !string.isEmpty && !key.isEmpty else {
            print("Can't add an empty string to the keychain")
            throw KeychainFacadeError.invalidContent
        }
        
        var queryDictionary = setupQueryDictionary(forKey: key)
        queryDictionary[kSecValueData as String] = string.data(using: .utf8)
        
        let status = SecItemAdd(queryDictionary as CFDictionary, nil)
        if status != errSecSuccess {
            throw KeychainFacadeError.failure(status: status)
        }
    }
}
