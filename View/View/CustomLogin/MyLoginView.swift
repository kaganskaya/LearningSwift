//
//  MyLoginView.swift
//  View
//
//  Created by liza_kaganskaya on 2/11/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit



@IBDesignable
class MyLoginView: UIView {
    
    override func prepareForInterfaceBuilder(){
        super.prepareForInterfaceBuilder()
        
        setup()
    }
   
    
    @IBOutlet weak var backgrView: UIImageView!
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet var myView: UIView!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        let bundle = Bundle(for: MyLoginView.self)
        bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        
        
        //Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(myView)
        myView.frame = self.bounds
        myView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    
    }
    
    func blur()
    {
        
        
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgrView.bounds

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        backgrView.addSubview(blurEffectView)

        
    }
    
    func show(){
        
        myView.isHidden = false
        
        formView.isHidden = false
        
       backgrView.isHidden = false
        
        
    }
    
    
    
    
  
   

}
