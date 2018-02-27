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
        let brianUser = User(name: "Ironman", username: "@iromman", bioText: "I'm Ironman", profileImage: #imageLiteral(resourceName: "IronMan"))
        let rayUser = User(name: "batman", username: "@batman", bioText: "Ray Wenderlich is an iPhone develop and tweets on topics related to iPhone, software, and gaming. Chect out our conference.", profileImage:#imageLiteral(resourceName: "batman"))
        
        return [brianUser, rayUser]
    }()
    
//    let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
