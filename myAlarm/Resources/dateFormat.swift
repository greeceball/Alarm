//
//  dateFormat.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

extension Date {
    
    var formatted: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter.string(from: self)

    }
}
