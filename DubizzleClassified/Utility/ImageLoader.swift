//
//  ImageLoader.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import Foundation
import UIKit

@objcMembers class ImageLoader : NSObject {
  
    class func loadURL(url: URL, placeholder: UIImage?, cache: URLCache? = nil,myImageView: UIImageView) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            myImageView.image = image
        } else {
            myImageView.image = placeholder
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        myImageView.image = image
                    }
                }
            }).resume()
        }
    }
}
