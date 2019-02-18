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
    
    
    @IBOutlet weak var backgrView: UIImageView!
    
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet var myView: UIView!
    
    let backGroundArray = [UIImage(named: "Image"),UIImage(named:"burg"),UIImage(named:"wog"),UIImage(named:"Shum")]
   
    private var idx: Int = 0
    
    
    override func prepareForInterfaceBuilder(){
        super.prepareForInterfaceBuilder()
        
        setup()
    }
    
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
        formView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override var bounds: CGRect{
        
        didSet{
            layer.allowsGroupOpacity = false
        }
    }
        
    
    
    
    @objc func changeBackground(){
        
        if idx == backGroundArray.count-1{
            idx = 0
        }
        else{
            idx+=1
        }
        
        let toImage = backGroundArray[idx];
        
        UIView.transition(with: self.backgrView, duration: 4, options: .transitionCrossDissolve, animations: {self.backgrView.image = toImage}, completion: nil)
        
        
    }
    
    func setupImage(){
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark)) as UIVisualEffectView
        
            visualEffectView.frame = self.formView.frame
        
            visualEffectView.alpha = 0.5
        
            backgrView.image = UIImage(named: "burg")
        
            backgrView.addSubview(visualEffectView)
        

        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(changeBackground), userInfo: nil, repeats: true)
        
    }
    
    
    func blur(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
            blurEffectView.frame = backgrView.bounds

            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
            backgrView.addSubview(blurEffectView)
   
    }
    
    func show(){
        
        myView.isHidden = false
        
        formView.isHidden = false
        
        backgrView.isHidden = false

        setupImage()
    }
    
  

}
