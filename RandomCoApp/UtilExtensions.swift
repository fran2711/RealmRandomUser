//
//  UtilExtensions.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    static func getFormattedDate(string: String , formatter:String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formatter
        
        guard let date: Date = dateFormatterGet.date(from: string) else { return "" }
        return dateFormatterPrint.string(from: date)
    }
}
