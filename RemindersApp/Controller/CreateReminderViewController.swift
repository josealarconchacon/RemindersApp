//
//  CreateReminderViewController.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import UIKit

class CreateReminderViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var setDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func comleted(_ sender: UISwitch) {
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        // create a reminder object
        let reminder = Reminder(title: textField.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        ReminderService.share.createReminder(reminder: reminder)
        // dissmis controller
        navigationController!.popViewController(animated: true)
    }
}
