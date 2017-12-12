//
//  GroupFeedVC.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 12/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTxtFld: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        
    }
    
}
