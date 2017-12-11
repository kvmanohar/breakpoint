//
//  SecondViewController.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 03/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    
    @IBOutlet weak var groupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
}


//MARK: TableView delegates
extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
            as? GroupCell else { return UITableViewCell() }
        
        cell.configureCell(title: "SampleGroup", description: "This is a sample cell", memberCount: 3)
        return cell
    }
    
}

