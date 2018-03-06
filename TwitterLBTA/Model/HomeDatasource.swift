//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/2/22.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        var users = [User]()
        
        let array = json["users"].array
        for userJSON in array! {
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }

    let tweets:[Tweet] = {
        
        let ironManUser = User(name: "Ironman", username: "@iromman", bioText: "Iron Man is a fictional superhero appearing in American comic books published by Marvel Comics. The character was created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby. The character made his first appearance in Tales of Suspense #39 (cover dated March 1963).", profileImage: #imageLiteral(resourceName: "IronMan"))
        let tweet = Tweet(user: ironManUser, message:"Iron Man is a fictional superhero appearing in American comic books published by Marvel Comics. The character was created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby." )
        
        let tweet2 = Tweet(user: ironManUser, message:"Iron Man is a fictional superhero appearing in American comic books published by Marvel Comics." )
        return [tweet, tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
}
