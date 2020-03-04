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

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmController.sharedInstance.alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell else {return UITableViewCell()}
        let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
        cell.alarm = alarm
        cell.delegate = self
        return cell
    }
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
                AlarmController.sharedInstance.deleteAlarm(alarm: alarm)
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        }

        // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailViewTable" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    if let destinationVC = segue.destination as? AlarmDetailTableViewController {
                        let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
                    destinationVC.alarm = alarm
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
    
    extension AlarmListTableViewController: SwitchTableViewCellDelegate {
        func alarmSwitchTapped(for cell: SwitchTableViewCell) {
            guard let indexPath = tableView.indexPath(for: cell) else {return}
            let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
            AlarmController.toggleEnabled(for: alarm)
            cell.updateViews()
            tableView.reloadData()
        }
}
