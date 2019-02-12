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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.blur()
        loginView.show()
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
