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
    
    var id:Business?
    var presenter: DetailPresenter!
    var reviews:[Reviews] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillImageView(url: (id?.image_url)!)
        
        presenter.getDataById(id: (id?.id)!)
        
        self.reviewsView.isHidden = true
        
        reviewsView.delegate = self
        reviewsView.dataSource = self
        
    }
   
    

    func fillImageView(url:String){
        
         let myUrl = URL(string: url)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: myUrl!)
            
            DispatchQueue.main.async {
                
                self.imageView.image = UIImage(data: data!)
                
            }
        }
        
        
        
    }


}

extension DetailViewController:  DetailView , UITableViewDataSource , UITableViewDelegate {
    func showReviews(review: [Reviews]) {
        self.reviews = review
        self.reviewsView.reloadData()
        print(reviews.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "revCell",for: indexPath) as? ReviewCell
        
            cell?.fillReviewCell(text: reviews[indexPath.row].text)
        
        return cell!
    }
    
    
    
    
}
