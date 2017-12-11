//
//  GroupCell.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 11/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescriptionLbl.text = description
        self.memberLbl.text = "\(memberCount) members."
    }
    
    
}
