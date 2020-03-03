//
//  AlarmController.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class AlarmController {
    
    //Source of Truth
    var alarms: [Alarm] = []
    static var sharedInstance = AlarmController()
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) -> Alarm{
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        
        alarms.append(alarm)
        
        return alarm
    }
    
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.name = name
        alarm.fireDate = fireDate
    }
    
    func delete(alarm: Alarm){
        guard let index = alarms.firstIndex(of: alarm) else {return}
        alarms.remove(at: index)
    }
}
