//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func alarmSwitchTapped(for: SwitchTableViewCell)
}

class SwitchTableViewCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.alarmSwitchTapped(for: self)
    }
    
    //MARK: - Properties
    weak var delegate: SwitchTableViewCellDelegate?
    
    var alarm: Alarm? {
    didSet {
        updateViews()
        }
        
    }

    func updateViews() {
        guard let alarm = alarm else {return}
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
    }
}
