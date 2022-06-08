//
//  LoginViewController.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 14.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        
        //Hide error label
        errorLabel.alpha = 0
        
        //Style elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        
    }
    

}
