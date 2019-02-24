//
//  LoginInteractor.swift
//  View
//
//  Created by liza_kaganskaya on 2/22/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class LoginInteractorImpl: LoginInteractor {
    var localProvider: LocalProvider!
    
    init(provider: LocalProvider!){
        self.localProvider = provider
    }
    
    
    func getLoginData() -> Observable<MyUser> {
        return localProvider!.getLoginData()
    }
    
    
    
    
}
