//
//  UserCell.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 08/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image:UIImage, email:String, isSelected: Bool){
        self.profileImage.image = image
        self.emailLbl.text = email
        self.checkImage.isHidden = !isSelected
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if showing == false {
                self.checkImage.isHidden = false
                showing = true
            } else {
                self.checkImage.isHidden = true
                showing = false
            }
        }
    }

}
