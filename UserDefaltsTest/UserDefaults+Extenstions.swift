//
//  UserDefaults+Extenstions.swift
//  UserDefaltsTest
//
//  Created by Soft on 13/05/1943 Saka.
//

import Foundation

extension UserDefaults {

    private enum UserDefaultsKeys: String {
        case isSwitchOn
        case signedInUser
    }

    var swithIsOn: Bool {
        get {
            bool(forKey: UserDefaultsKeys.isSwitchOn.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.isSwitchOn.rawValue)
        }
    }
    
    var signedInUser: User? {
        get {
            if let data = object(forKey: UserDefaultsKeys.signedInUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
        }
        
        set {
            if newValue == nil {
                removeObject(forKey: UserDefaultsKeys.signedInUser.rawValue)
            }else{
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultsKeys.signedInUser.rawValue)
            }
        }
    }
}
