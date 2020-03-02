//
//  Alarm.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class Alarm {
    
    var fireDate: Date
    var fireTimeAsString: String {
        get {
            return "\(self.fireDate)"
        }
    }
    
    let name: String
    var enabled: Bool
    
    let uuid: String

    init(fireDate: Date, name: String, enabled: Bool, uuid: String) {
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
        self.uuid = UUID().uuidString
    }

//    func fireTimeAsString(from date: Date) -> String {
//        self.fireDate = date
//        return fireTimeAsString
//    }
}
