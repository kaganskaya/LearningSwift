//
//  DetailView.swift
//  CityOnMap
//
//  Created by liza_kaganskaya on 2/5/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class DetailView: UIView {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var lat = 0.0
    
    var long = 0.0
    
    var imageUrl:String = " "
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(myView)
        myView.frame = self.bounds
        myView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
    
    
    func show(){
        
        myView.isHidden = false
        
        label.text = String(format: "Lat: %.6f // Lon: %.6f", lat , long)
        
        //activity.startAnimating()
        
        activity.hidesWhenStopped = true
        
       // showImage(imageUrl: imageUrl)
        
        
    }
    
    
    
   private func showImage(imageUrl: String){
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
           
            DispatchQueue.main.async {
                
                self.imageView.image = UIImage.gif(url: imageUrl)
                
                self.activity.stopAnimating()
            }
            
        }
    
    }
}
