//
//  TableViewCell.swift
//  View
//
//  Created by liza_kaganskaya on 2/10/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit



class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lName: UILabel!
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    func fillImageView(business:Business){
        
        if let myUrl = URL(string: business.image_url!){
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: myUrl)
            
            DispatchQueue.main.async {
                
                self.backgroundImage.image = UIImage(data: data!)
                
                self.lName.text = business.name
                
            }
            }}
        
    }
    
    func changeTextColor(){
        self.lName.textColor = .black
        
    }
    
   
}
