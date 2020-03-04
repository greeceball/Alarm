//
//  AlarmDetailTableViewController.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    var alarmIsOn: Bool = true
    
    //MARK: - properties
    var alarm: Alarm? {
        didSet {
            alarmIsOn = alarm?.enabled ?? true
            loadViewIfNeeded()
            updateViews()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        updateAlarm()
    }
    
    //MARK: - outlets
    @IBOutlet weak var dateLabel: UIDatePicker!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var enableButtonLabel: UIButton!
    @IBAction func enableButtonTapped(_ sender: Any) {
        alarmIsOn = !alarmIsOn
        updateAlarm()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let nameLabel = nameLabel.text {
            if let dateLabel = dateLabel?.date{
                if let alarm = alarm {
                    AlarmController.sharedInstance.updateAlarm(alarm: alarm, fireDate: dateLabel, name: nameLabel, enabled: alarmIsOn)
                }else{
                    AlarmController.sharedInstance.addAlarm(fireDate: dateLabel, name: nameLabel, enabled: alarmIsOn)
                }
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func updateViews() {
        guard let alarm = self.alarm else {return}
        dateLabel.setDate(alarm.fireDate, animated: false)
        nameLabel.text = alarm.name
    }
    
    func updateAlarm(){
        if alarmIsOn {
            enableButtonLabel.setTitle("Turn Off", for: .normal)
            enableButtonLabel.backgroundColor = .red
        } else {
            enableButtonLabel.setTitle("Turn On", for: .normal)
            enableButtonLabel.backgroundColor = .green
        }
        
    }
}
