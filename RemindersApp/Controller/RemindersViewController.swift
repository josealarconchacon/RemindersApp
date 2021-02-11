//
//  RemindersViewController.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import UIKit

class RemindersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func editButtonDidPressed(_ sender: UIButton) {
        if tableView.isEditing {
            tableView.isEditing = false
//            sender.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            tableView.isEditing = true
            
        }
    }
}

extension RemindersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.share.getNumberOfReminder()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Deque the cell from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as! ReminderCell
        // Get the reminder for the given index path
        let reminder = ReminderService.share.getReminder(index: indexPath.row)
        // Update the cell
        cell.update(reminder: reminder)
        // Return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.share.toggleCompletedReminder(index: indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // delete cell
        if editingStyle == .delete {
            ReminderService.share.deleteReminder(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
