//
//  DetailViewController.swift
//  View
//
//  Created by liza_kaganskaya on 2/10/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var LabelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let object = places[i]

        let url = URL(string: object["link"]!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            
            DispatchQueue.main.async {
                
                self.imageView.image = UIImage(data: data!)
                
            }
        }
        
        LabelName.text = object["name"]
        
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
