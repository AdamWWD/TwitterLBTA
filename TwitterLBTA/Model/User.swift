//
//  User.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/2/27.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable{
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
        
        self.profileImage = UIImage()
    }
}
