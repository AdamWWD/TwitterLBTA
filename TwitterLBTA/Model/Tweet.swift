//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/3/5.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
    
}
