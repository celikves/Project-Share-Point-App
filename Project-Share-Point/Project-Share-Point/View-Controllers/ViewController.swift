//
//  ViewController.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }

    func setUpElements(){
        
        Utilities.styleFilledButton(signupButton)
        Utilities.styleHollowButton(loginButton)
    }

}

