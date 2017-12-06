//
//  LoginVC.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 03/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var emailTextField: InsetTextField!
    
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    //MARK: IBActions
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if emailTextField.text != nil &&
            passwordTextField.text != nil {
            
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, loginComplete: { (success, nil) in
                            print("Successfully registered user")
                            self.dismiss(animated: true, completion: nil)
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })//registerUser
                
            })//loginUser
        }
        
    } //signInBtnPressed
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        
    } //closeBtnPressed
    
} //LoginVC


extension LoginVC: UITextFieldDelegate {
    
    
    
}
