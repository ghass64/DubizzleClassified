//
//  UIView.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import UIKit

extension UIView {
    
    func shadowRoundedView() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4
        if #available(iOS 13.0, *) {
            layer.shadowColor = UIColor.label.cgColor
        } else {
            // Fallback on earlier versions
        }
        layer.cornerRadius = 5
        layer.masksToBounds = true
        clipsToBounds = false
    }
    
    func roundedView() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    func shadowView() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4
        if #available(iOS 13.0, *) {
            layer.shadowColor = UIColor.label.cgColor
        } else {
            // Fallback on earlier versions
        }
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
}
