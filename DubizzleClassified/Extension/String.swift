//
//  String.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import Foundation

extension String {
   
    func convertDateFormat() -> String {
        
        let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

        let oldDate = dateFormatter.date(from: self)

        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "MMM dd yyyy"

        return convertDateFormatter.string(from: oldDate!)
   }
    
    
}
