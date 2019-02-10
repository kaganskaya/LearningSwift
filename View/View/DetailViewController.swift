//
//  DetailViewController.swift
//  View
//
//  Created by liza_kaganskaya on 2/10/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var reviewsView: UITableView!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var text: UIView!
    
    @IBAction func revBut(_ sender: UIButton) {
        self.text.isHidden = true
         self.reviewsView.isHidden = false
        
    }
    @IBAction func descBut(_ sender: UIButton) {
        
        self.text.isHidden = false
        
        self.reviewsView.isHidden = true
            
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var LabelName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let object = places[i]
        
            fillImageView(url: object["link"]!, imageView: imageView)
        
            LabelName.text = object["name"]
        
         self.reviewsView.isHidden = true
        
    }
    

    func fillImageView(url:String, imageView:UIImageView){
        
         let myUrl = URL(string: url)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: myUrl!)
            
            DispatchQueue.main.async {
                
                imageView.image = UIImage(data: data!)
                
            }
        }
        
        
        
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
