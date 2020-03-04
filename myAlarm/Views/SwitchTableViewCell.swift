//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func alarmSwitchTapped(cell: SwitchTableViewCell, isSet: Bool)
}

class SwitchTableViewCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    //MARK: - Properties

    weak var delegate: SwitchTableViewCellDelegate?
    
    var alarm: Alarm? {
    didSet {
        updateViews()
        }
        
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.alarmSwitchTapped(cell: self, isSet: alarmSwitch.isOn)
    }
    
        
    
    
    
//    @IBAction func switchValueChanged(_ sender: UISwitch) {
//        delegate?.alarmSwitchTapped(cell: self, isSet: alarmSwitch.isOn)
//    }
//
    func updateViews() {
        guard let alarm = alarm else {return}
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
    }
}
