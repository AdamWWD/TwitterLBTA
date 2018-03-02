//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/2/22.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users:[User] = {
        let brianUser = User(name: "Ironman", username: "@iromman", bioText: "Iron Man is a fictional superhero appearing in American comic books published by Marvel Comics. The character was created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby. The character made his first appearance in Tales of Suspense #39 (cover dated March 1963).", profileImage: #imageLiteral(resourceName: "IronMan"))
        let batman = User(name: "batman", username: "@batman", bioText: "Batman is a fictional superhero appearing in American comic books published by DC Comics. The character was created by artist Bob Kane and writer Bill Finger,[4][5] and first appeared in Detective Comics #27 (1939). ", profileImage:#imageLiteral(resourceName: "batman"))
        
        let thor = User(name: "Thor", username: "@Thor", bioText: "Thor is a fictional superhero appearing in American comic books published by Marvel Comics. .", profileImage: #imageLiteral(resourceName: "Thor"))
        
        
        return [brianUser, batman, thor]
    }()
    
    let tweets = ["tweet1", "tweet2"]
    
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
