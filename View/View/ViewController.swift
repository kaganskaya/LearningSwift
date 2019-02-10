//
//  ViewController.swift
//  View
//
//  Created by liza_kaganskaya on 2/10/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

var i = 0


class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

    
    @IBOutlet weak var tableViewData: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My favorites"
        
        
        tableViewData.delegate = self
        tableViewData.dataSource = self
            
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell",for: indexPath) as? TableViewCell

        let object = places[indexPath.row]
        
            cell?.lName.text = object["name"]
  
        let url = URL(string: object["link"]!)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            
                DispatchQueue.main.async {
                    
                    cell!.backgroundImage.image = UIImage(data: data!)
                
                }
            }
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        i = indexPath.row
        
        performSegue(withIdentifier:"detailSegue", sender: self)
    }
    
   
    
}

        



