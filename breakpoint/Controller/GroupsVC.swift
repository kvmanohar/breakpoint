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
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroup { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.groupTableView.reloadData()
            }
        }
    }//viewDidAppear
    
}


//MARK: TableView delegates
extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
            as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        
        cell.configureCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else { return }
        
        groupFeedVC.initData(forGroup: groupsArray[indexPath.row])
        
        present(groupFeedVC, animated: true, completion: nil)
        
    }
    
}

