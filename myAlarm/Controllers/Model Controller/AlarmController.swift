//
//  AlarmController.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class AlarmController {
   
    static var sharedInstance = AlarmController()
    
    //Source of Truth
    var alarms: [Alarm] = [Alarm(fireDate: Date(timeIntervalSinceNow: 0.60), name: "Lunch Time", enabled: false)]
    
    
    static func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(alarm)
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        if let index = alarms.firstIndex(of: alarm) {
            alarms[index].name = name
            alarms[index].fireDate = fireDate
            alarms[index].enabled = enabled
        }
    }
    
    func deleteAlarm(alarm: Alarm){
        if let index = alarms.firstIndex(of: alarm) {
        alarms.remove(at: index)
        }
    }
}
