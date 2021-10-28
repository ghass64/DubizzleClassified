//
//  Items.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import Foundation

// MARK: - Items
struct Items: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}
