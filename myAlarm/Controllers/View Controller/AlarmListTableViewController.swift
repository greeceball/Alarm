//
//  AlarmListTableViewController.swift
//  myAlarm
//
//  Created by Colby Harris on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.sharedInstance.alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell else {return UITableViewCell()}
        let indexPath = AlarmController.sharedInstance.alarms[indexPath.row]
        cell.delegate = self
        return cell
    }
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
                AlarmController.sharedInstance.deleteAlarm(alarm: alarm)
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

        // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailViewTable" {
                guard let indexPath = tableView.indexPathForSelectedRow,
                    let destinationVC = segue.destination as? AlarmDetailTableViewController else {return}
                    let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
                    destinationVC.alarm = alarm
                }
            }
        }

    extension AlarmListTableViewController: SwitchTableViewCellDelegate {
        func alarmSwitchTapped(cell: SwitchTableViewCell, isSet: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
            let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
            AlarmController.toggleEnabled(for: alarm)
            cell.updateViews()
        }
}
