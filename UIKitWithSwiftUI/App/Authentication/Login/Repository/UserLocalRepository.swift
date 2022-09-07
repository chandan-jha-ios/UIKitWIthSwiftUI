//
//  UserLocalRepository.swift
//  CleanCodeUIKit
//
//  Created by Chandan Jha on 21/08/22.
//

import Foundation

struct UserLocalRepository: UserRepository {
    
    enum Keys: String {
        case wrongPassword = "Entered password is wrong"
        case userNotFound = "User is not registered."
    }
    
    func create(_ user: LoginRequest) {
        UserDefaults.standard.set(user.password, forKey: user.userName)
        UserDefaults.standard.synchronize()
    }

    func validate(_ user: LoginRequest) -> ValidationResult {
        if isUserExist(userName: user.userName) {
            let result = validatePassword(user)
            let message = result ? nil : Keys.wrongPassword.rawValue
            return (result, message)
        } else {
            return (false, Keys.userNotFound.rawValue)
        }
    }
    
    func validatePassword(_ user: LoginRequest) -> Bool {
        if let value = UserDefaults.standard.value(forKey: user.userName) as? String,
           value == user.password {
            return true
        }
        return false
    }
    
    func isUserExist(userName: String) -> Bool {
        UserDefaults.standard.value(forKey: userName) as? String != nil
    }
}
