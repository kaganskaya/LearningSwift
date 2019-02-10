//
//  ViewController.swift
//  Att2
//
//  Created by liza_kaganskaya on 2/8/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillTextView()
        
    }
            
    func fillTextView(){
        
        let attributedText = NSMutableAttributedString(string: "Alex likes to say 'meeehh'. Alex is not as smart as Liza used to think =))", attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        
        
    }
    
}
