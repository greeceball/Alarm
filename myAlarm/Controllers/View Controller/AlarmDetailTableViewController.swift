//
//  AlarmDetailTableViewController.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    //MARK: - outlets
    @IBOutlet weak var dateLabel: UIDatePicker!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var enableButtonLabel: UIButton!
    
    //MARK: - properties
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    
    var alarmIsOn: Bool = true
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func enableButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let nameLabel = nameLabel.text, let dateLabel = dateLabel?.date, let enableButtonLabel = enableButtonLabel?.isEnabled else {return}
        
        if let alarm = alarm {
            AlarmController.sharedInstance.updateIsSetFor(alarm: alarm, enabled: alarm.enabled)
            } else {
            AlarmController.sharedInstance.addAlarm(fireDate: dateLabel, name: nameLabel, enabled: enableButtonLabel)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard let alarm = alarm else {return}
        dateLabel.date = alarm.fireDate
        nameLabel.text = alarm.name
        enableButtonLabel.titleLabel?.text = alarm.enabled ? "Enabled" : "Disabled"
    }
    
     // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
