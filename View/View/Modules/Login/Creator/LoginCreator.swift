//
//  LoginCreator.swift
//  View
//
//  Created by liza_kaganskaya on 2/22/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import UIKit

/*
 detail
 */
class LoginCreatorImpl: BaseCreator {
    
    
    
    
    static func getControllerIndifier() -> String {
        return "LoginController"
    }
    
    static func getStoryBoardName() -> String {
        return "LoginView"
    }
    
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! LoginConroller
        
        let localProvider: LocalProvider  = LocalProvider()
        let presenter = LoginPresenterImpl()
        let interactor = LoginInteractorImpl(provider: localProvider)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        
        
        return view
    }
}
