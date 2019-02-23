//
//  UserDefaults.swift
//  View
//
//  Created by liza_kaganskaya on 2/23/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: "savedUserSession")
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: "savedUserSession")
    }
    
}
