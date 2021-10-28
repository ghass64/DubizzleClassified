//
//  AttributedString.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import Foundation

import UIKit

@objcMembers class AttributedString : NSObject {
    
    class func getAttributedString(price: String,fontSize:Float) -> NSAttributedString {
        
        let priceArr = price.components(separatedBy: " ")
        var currency = ""
        if priceArr.count > 0 {
            currency = priceArr[0]
        }
        
        let range = (price as NSString).range(of: currency)
        let attributedString = NSMutableAttributedString.init(string:price)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: CGFloat(fontSize)), range: range)
         return attributedString
    }
    
}
