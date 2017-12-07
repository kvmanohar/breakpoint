//
//  Message.swift
//  breakpoint
//
//  Created by Manohar Kurapati on 07/12/2017.
//  Copyright © 2017 Manosoft. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderID = senderId
    }
    
}
