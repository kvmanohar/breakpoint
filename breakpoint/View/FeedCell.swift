//
//  FeedCell.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 07/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
    
    
}
