//
//  LoginConroller.swift
//  View
//
//  Created by liza_kaganskaya on 2/11/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class LoginConroller: UIViewController {
  

    
    @IBOutlet var loginView: MyLoginView!
    var presenter: LoginPresenter!
    
    private var user = MyUser(username: " ", password: " ")
    
 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        presenter.getLoginData()
        
        loginView.getData(user: self.user)
        
        loginView.setup()

        loginView.completionHandler =
            { pressed,username,password in
                
                if pressed && username == "admin" && password == "admin" {
                    UserDefaults.standard.setIsLoggedIn(value: true)
                    Router.presentMainScreen(current: self)
                    
                }
                
                return pressed
                
        }
        
      
    }
    
    
   
    
    
    
}
extension LoginConroller: LoginView{
    func loginData(user: MyUser) {
        self.user = user
    }
    
}
