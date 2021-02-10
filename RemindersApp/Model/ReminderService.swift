//
//  ReminderService.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import Foundation

// manage the collection of reminders

class ReminderService {
    private var reminders = [Reminder]()
    
    // create
    func createReminder(reminder: Reminder) {
        reminders.append(reminder)
    }
    
    // update
    func updateReminder(reminder: Reminder, index: Int) {
        reminders[index] = reminder
    }
    // get number of reminders
    func getNumberOfReminder() -> Int {
        return reminders.count
    }
    
    // get specific reminder
    func getReminder(index: Int) -> Reminder {
        return reminders[index]
    }
    
    // toggle completed status of reminder
    func toggleCompletedReminder(index: Int) {
        let reminder = getReminder(index: index)
        reminder.isCompleted = !reminder.isCompleted
    }
    
    // get the list of reminder
    func getListOfReminder() -> [Reminder]{
        return reminders
    }
    
    // delete reminder
    func deleteReminder(index: Int) {
        reminders.remove(at: index)
    }
    
    // get favorites reminder
    func favoriteReminder() -> Reminder? {
        return reminders.first
    }

}
