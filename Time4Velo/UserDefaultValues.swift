//
//  UserDefaultValues.swift
//  Time4Velo
//
//  Created by Patryk Bejgrowicz on 17.07.2017.
//  Copyright © 2017 Patryk Bejgrowicz. All rights reserved.
//

import RxSwift

enum UserDefalutsValues: String {
    case authToken = "token"
}

final class UserDefaultsService {
    static func getValue(forKey key: UserDefalutsValues) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    static func setValue(_ value: String?, forKey key: UserDefalutsValues) {
        guard let newValue = value else {
            UserDefaults.standard.removeObject(forKey: key.rawValue)
            return
        }
        UserDefaults.standard.set(newValue, forKey: key.rawValue)
    }
    
    static func removeAllValues() {
        let keys = [
            UserDefalutsValues.authToken.rawValue
        ]
        
        for value in keys {
            UserDefaults.standard.removeObject(forKey: value)
        }
    }
}
