//
//  TableViewCell.swift
//  View
//
//  Created by liza_kaganskaya on 2/10/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

let places =  [["link":"https://bit.ua/wp-content/uploads/2014/03/IMG_2789.jpg", "name":"MilkBar"],["link":"https://tomato.ua/image/resize/storage/restaurants/5839b3f7b0e40900191b51ea/1496317756592fff3c9f8d1_592ffe85742d44.04066840.jpeg", "name":"The Burger"],["link":"https://media-cdn.tripadvisor.com/media/photo-s/15/0f/b1/cf/stories-cafe.jpg", "name":"STORIES CAFE"],["link":"https://img.the-village.com.ua/the-village.com.ua/post_image-image/yyvOIftJAVdYQvN0wBOr-w-article.jpg","name":"Белый Шум"]]

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lName: UILabel!
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    func fillImageView(url:String, imageView:UIImageView){
        
        let myUrl = URL(string: url)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: myUrl!)
            
            DispatchQueue.main.async {
                
                imageView.image = UIImage(data: data!)
                
            }
        }
        
    }
    
   
}
