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
    
    func transitionToHome() {
        
       let homeViewController  =  storyboard?.instantiateViewController(withIdentifier: Consts.StoryBoard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    

}


extension LoginViewController {
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard let email = self.emailTextField.text else { return}
        guard let password = self.passwordTextField.text else { return}
        
        let modelLogin = LoginModel(emailAddress: email, password: password)
        APIManager.shareInstance.callingloginAPI(login: modelLogin) {
            (result) in
            switch result {
            case .success(let json):
                print(json as AnyObject)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
    
}

