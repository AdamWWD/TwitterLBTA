//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/3/1.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes:[NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = " \(tweet.user.username)\n"
            
            attributedText.append(NSAttributedString(string: usernameString, attributes:[NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.gray]) )
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)]))
 
            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME SAMPLE TEXT"
//        tv.backgroundColor = .yellow
        return tv
    }()

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
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
