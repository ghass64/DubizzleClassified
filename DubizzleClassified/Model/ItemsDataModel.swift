//
//  ItemsDataModel.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import Foundation

@objcMembers class ItemsDataModel: NSObject {
     let createdAt: String?
     let price: String?
     let name: String?
     let imageUrls: String?
     let imageUrlsThumbnails: String?

    init(model: Result) {
        createdAt = model.createdAt.convertDateFormat()
        price = model.price
        name = model.name
        imageUrls = model.imageUrls[0]
        self.imageUrlsThumbnails = model.imageUrlsThumbnails[0]
    }

}
