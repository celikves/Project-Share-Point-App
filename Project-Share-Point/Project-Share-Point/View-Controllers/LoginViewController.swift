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
    
    /*
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        
        //Validate user
        let error = validateFields()
        //there is sth wrong with input fields.
        if error != nil {
            showError(error!)
        }
        else{
            guard let fname = self.firstNameTextField.text else { return}
            guard let lname = self.lastNameTextField.text else { return}
            guard let uname = self.usernameTextField.text else { return}
            guard let email = self.emailTextField.text else { return}
            guard let passwd = self.passwordTextField.text else { return}
            //Create the user
            
            let registerModel = RegisterModel(username: uname, password: passwd, firstName: fname, lastName: lname, emailAddress: email)
            APIManager.shareInstance.callingregisterAPI(register: registerModel){
                (isSuccess,str) in
                if isSuccess {
                    let alert = UIAlertController(title: "Successed", message: str, preferredStyle: .alert)

                           // add an action (button)
                           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) -> Void in
                               // Present the other alertView
                               self.transitionToHome()
                           }))

                           // show the alert
                           self.present(alert, animated: true, completion: nil)
                    
                }else{
                    // create the alert
                            let alert = UIAlertController(title: "Failed", message: str, preferredStyle: UIAlertController.Style.alert)

                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                   
                }
            }
         
            //self.transitionToHome()
            
        }
        
    }
     */
}

