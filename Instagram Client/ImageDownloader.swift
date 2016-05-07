//
//  ImageDownloader.swift
//  Instagram Client
//
//  Created by yusuf_kildan on 07/05/16.
//  Copyright © 2016 yusuf_kildan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadFromURL(url : NSURL) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        }).resume()
    }
}