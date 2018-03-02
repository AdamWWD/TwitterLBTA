//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/3/1.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "IronMan")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r:230, g:230, b:230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
    }
}
