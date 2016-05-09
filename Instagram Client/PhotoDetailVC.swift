//
//  DetailVC.swift
//  Instagram Client
//
//  Created by yusuf_kildan on 10/05/16.
//  Copyright © 2016 yusuf_kildan. All rights reserved.
//

import UIKit

class PhotoDetailVC: UIViewController , UIScrollViewDelegate {
    
    var imageURL : NSURL?
    var photoView : UIImageView?
    var scrollViewForZoom : UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Details"
        self.view.backgroundColor = UIColor.whiteColor()
        
        // set UIScrollView for zooming
        scrollViewForZoom = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        self.scrollViewForZoom?.minimumZoomScale = 1.0
        self.scrollViewForZoom?.maximumZoomScale = 6.0
        scrollViewForZoom?.delegate = self
        self.view.addSubview(scrollViewForZoom!)
        
        // Configure image
        photoView = UIImageView(frame: CGRectMake(0, 75, CGRectGetWidth(self.view.frame),CGRectGetWidth(self.view.frame)))
        photoView!.downloadFromURL(imageURL!)
        self.scrollViewForZoom!.addSubview(photoView!)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.photoView
    }
    
    
}
