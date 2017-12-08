//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 06/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.emailLbl.text = Auth.auth().currentUser?.email
        
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        if textView.text != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            DataService.instance.uploadPost(withMessage: textView.text, forUID: uid, withGroupKey: nil,
                                            sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("Error while posting message.")
                }
            })
        }
        
    }//sendBtnPressed
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    
}
