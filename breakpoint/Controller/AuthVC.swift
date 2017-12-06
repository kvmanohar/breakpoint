//
//  AuthVC.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 03/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: IBActions
    @IBAction func byEmailBtnPressed(_ sender: Any) {
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
    }
    
    @IBAction func loginWithGoogleBtnPressed(_ sender: Any) {
    }
    
    @IBAction func loginWithFacebookBtnPressed(_ sender: Any) {
    }
    



}
