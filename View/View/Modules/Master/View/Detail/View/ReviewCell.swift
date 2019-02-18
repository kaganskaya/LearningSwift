//
//  ReviewCell.swift
//  View
//
//  Created by liza_kaganskaya on 2/18/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var reviewLabel: UILabel!
   
    func fillReviewCell(text:String){
        
        reviewLabel.text = text
        
        
    }
    
    
}
