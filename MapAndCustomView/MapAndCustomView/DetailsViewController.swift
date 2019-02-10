//
//  DetailsViewController.swift
//
//  Created by liza_kaganskaya on 2/5/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class DetailsViewController: UIViewController {

    @IBOutlet weak var coordinatesLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    var lat = 0.0
    
    var long = 0.0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Coordinates"
        
        coordinatesLabel.text = String(format: "Lat: %.6f // Lon: %.6f", lat , long)
        showImage(imageUrl: "https://media1.tenor.com/images/a9e44b6a5d92ab61a195daf9bf89d75f/tenor.gif?itemid=8206875")
        
    }
    
    func showImage(imageUrl: String){
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
           
            DispatchQueue.main.async {
                
                self.image.image = UIImage.gif(url: imageUrl)
                
            }
          
        }

}
}
