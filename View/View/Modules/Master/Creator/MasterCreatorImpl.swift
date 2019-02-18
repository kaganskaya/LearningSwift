//
//  MasterCreatorImpl.swift
//  View
//
//  Created by liza_kaganskaya on 2/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation

import UIKit

class MasterCreatorImpl:   BaseCreator {
    
    

    static func getControllerIndifier() -> String {
        return "ViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "Main"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! ViewController
        
        let lcu = LocationUtil()
        
        let glp = GlobalProvider()
        
        let rep  = Repos(util:lcu,glob:glp)
        
        let interactor = MasterInteratorImpl(repository: rep)

        let presenter = MasterPresenterImpl()
        
        let navigation = UINavigationController(rootViewController: view)
        navigation.navigationBar.tintColor = .black
        navigation.title = "My favorites"
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigation.navigationBar.topItem!.backBarButtonItem = backButton
        
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        
        return navigation
    }
    
}
