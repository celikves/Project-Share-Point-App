//
//  SignUpViewController.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 14.05.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        //Hide the error label
        errorLabel.alpha = 0
        
        //Style the elements 
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField((lastNameTextField))
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(confirmPasswordTextField)
        Utilities.styleFilledButton(signupButton)
    
    }
    
    func validateFields () -> String? {
        //Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill the all fields."
            
        }
        
        else if firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count<3 ||
                    lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count<3 || usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).count<3 {
            
            return "The fields Username must be a string or array type with a minimum length of 3."
            
        }
                    
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password is not secure enough
            return "Please make sure your password is at least 8 characters,contains a special character and a number."
        }
        
        return nil
    }

    func showError(_ message:String) {
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.numberOfLines = 3
        errorLabel.text = "Error : \(message)"
        errorLabel.alpha = 1
    }
    
    func transitionToLogin() {
        
       let loginViewController  =  storyboard?.instantiateViewController(withIdentifier: Consts.StoryBoard.loginViewController) as? LoginViewController
        
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}

extension SignUpViewController {
    
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
                               self.transitionToLogin()
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
}
