//
//  LoginContract.swift
//  View
//
//  Created by liza_kaganskaya on 2/22/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import MapKit

protocol LoginPresenter: class {
    var view: LoginView? { get set }
    var interactor: LoginInteractor! { get set }
    func getLoginData()
    func onViewDidLoad()
}

protocol LoginInteractor: class {
    
    var  localProvider: LocalProvider! {get set}
    func getLoginData() -> Observable<MyUser>
    
}

protocol LoginView: class {
    var presenter: LoginPresenter! { get set }
    func loginData(user:MyUser)
}

