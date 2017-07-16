//
//  SearchMethodsProtocol.swift
//  GaleryStruct
//
//  Created by MacBook Air on 30.05.17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import Foundation

protocol SearchMethods {
     
}


extension Date {
    static func from(string:String?) -> Date? {
        guard let string = string else {
            return nil
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.sssZ"
        
        return dateformatter.date(from: string)
    }
}


