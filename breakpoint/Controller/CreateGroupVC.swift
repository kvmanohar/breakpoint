//
//  CreateGroupVC.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 08/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var groupMemebersLable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }

    @objc func textFieldDidChange(){
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        }else{
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, completion: { (returnEmailArray) in
                self.emailArray = returnEmailArray
                self.tableView.reloadData()
            })
        }
    }//textFieldDidChange
    
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}//CreateGroupVC


//MARK: UITableViewDelegates
extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {
            return UITableViewCell()
        }
        
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
}


//MARK: UITextFieldDeletegates
extension CreateGroupVC: UITextFieldDelegate{
    
}
