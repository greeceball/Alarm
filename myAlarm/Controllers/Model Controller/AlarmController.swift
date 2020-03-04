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
    
    init() {
        self.alarms = self.mockAlarms
    }
    
    
    var mockAlarms: [Alarm] = {
        var getUp = Alarm(fireDate: Date(), name: "WakeUp", enabled: true)
        var goToSchool = Alarm(fireDate: Date(), name: "Go to school", enabled: false)
        var goToBed = Alarm(fireDate: Date(), name: "Go to bed", enabled: true)
        return [getUp, goToSchool, goToBed]
    }()
    
    static func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(alarm)
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.name = name
        alarm.fireDate = fireDate
    }
    
    func deleteAlarm(alarm: Alarm){
        guard let index = alarms.firstIndex(of: alarm) else {return}
        alarms.remove(at: index)
    }
    
    func updateIsSetFor(alarm: Alarm, enabled: Bool) {
              alarm.enabled = enabled
          }
}
