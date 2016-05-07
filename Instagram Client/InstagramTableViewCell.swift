//
//  InstagramTableViewCell.swift
//  Instagram Client
//
//  Created by yusuf_kildan on 07/05/16.
//  Copyright © 2016 yusuf_kildan. All rights reserved.
//

import UIKit

class InstagramTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    var post: InstagramPost!
    let smallPadding: CGFloat = 5.0
    var didSetupConstraints = false
    
    var userNameLabel: UILabel = UILabel.newAutoLayoutView()
    var publishTimeLabel: UILabel = UILabel.newAutoLayoutView()
    var userImageView : UIImageView = UIImageView.newAutoLayoutView()
    var mainImageView : UIImageView = UIImageView.newAutoLayoutView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews()
    {
        userImageView.layer.cornerRadius = 35.0
        userImageView.clipsToBounds = true
        userImageView.contentMode = .ScaleAspectFit
        userImageView.alpha = 1.0
        userImageView.autoresizesSubviews = true
        userImageView.opaque = true
        userImageView.image = UIImage(named: "placeholder-1")
        
        //mainImageView.contentMode = .ScaleAspectFit
        mainImageView.alpha = 1.0
        mainImageView.autoresizesSubviews = true
        mainImageView.opaque = true
        mainImageView.image = UIImage(named : "default-placeholder")
        
        userNameLabel.lineBreakMode = .ByTruncatingTail
        userNameLabel.numberOfLines = 0
        userNameLabel.font = UIFont(name: "Helvetica Neue", size: 15.0)!
        userNameLabel.textAlignment = .Left
        userNameLabel.textColor = UIColor.lightGrayColor()
        
        publishTimeLabel.lineBreakMode = .ByTruncatingTail
        publishTimeLabel.numberOfLines = 0
        publishTimeLabel.font = UIFont(name: "Helvetica Neue", size: 12.0)!
        publishTimeLabel.textAlignment = .Right
        publishTimeLabel.textColor = UIColor.darkGrayColor()
        publishTimeLabel.text = "5min. ago"
        
        contentView.addSubview(userNameLabel)
        contentView.addSubview(publishTimeLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(mainImageView)
        
        
    }
    
    override func updateConstraints()
    {
        if !didSetupConstraints {
            
            
            publishTimeLabel.autoMatchDimension(.Height, toDimension: .Height, ofView: userNameLabel)
            publishTimeLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: userNameLabel, withOffset: smallPadding)
            publishTimeLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: smallPadding)
            publishTimeLabel.autoPinEdgeToSuperviewEdge(.Trailing, withInset: smallPadding)
            
            userNameLabel.autoMatchDimension(.Height, toDimension: .Height, ofView: userImageView)
            userNameLabel.autoSetDimension(.Width, toSize: 120)
            userNameLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: smallPadding)
            userNameLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: userImageView, withOffset: smallPadding)
            
            
            userImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: smallPadding)
            userImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: smallPadding)
            userImageView.autoSetDimensionsToSize(CGSize(width: 70, height: 70))
            
            mainImageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: userImageView, withOffset: smallPadding)
            mainImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: smallPadding)
            mainImageView.autoPinEdgeToSuperviewEdge(.Right,withInset: smallPadding)
            mainImageView.autoSetDimension(.Height, toSize: 265)
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
    
    func configureCell(post: InstagramPost) {
        selectionStyle = .None
        
        userNameLabel.text = post.userName
        publishTimeLabel.text = NSDate().timeConverter(post.publishTime, numericDates: true)
        
        if let mainImageUrl = NSURL(string: post.mainImageURL) {
            mainImageView.downloadFromURL(mainImageUrl)
        }
        if let userImageURL = NSURL(string: post.userImageURL) {
            userImageView.downloadFromURL(userImageURL)
        }
        
    }
    override func prepareForReuse() {
        mainImageView.image = UIImage(named : "default-placeholder")
        userImageView.image = UIImage(named : "placeholder-1")
        userNameLabel.text = ""
        publishTimeLabel.text = ""
        
    }
    

}
