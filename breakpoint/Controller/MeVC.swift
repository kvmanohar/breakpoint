//
//  MeVC.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 06/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }

    @IBAction func signOutBtnPressed(_ sender: Any) {
    
        let logoutPopUp = UIAlertController(title: "LogOut?", message: "Are you sure you want to Logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "LogOut?", style: .destructive){ (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }catch{
                print(error)
            }
        }
        logoutPopUp.addAction(logoutAction)
        present(logoutPopUp, animated: true, completion: nil)
        
    }//singOutBtnPressed

}
