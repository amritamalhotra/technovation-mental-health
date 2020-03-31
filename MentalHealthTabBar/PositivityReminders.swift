//
//  PositivityReminders.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import UserNotifications

class PositivityReminders: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var messageDisplay: UITextView!
    @IBOutlet weak var currentTimeDisplay: UILabel!
    @IBOutlet weak var hourInput: UITextField!
    @IBOutlet weak var minuteInput: UITextField!
    @IBOutlet weak var updateNotification: UIButton!
    
    var notifHour:Int!
    var notifMin:Int!
    var dateComponents:DateComponents!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func setDefaultMessage(_ sender: Any) {
        messageDisplay.text = "Current Message:\nKeep Calm and Carry On!"
    }
    @IBAction func enterPressed(_ sender: Any) {
        messageDisplay.text = "Current Message:\n\(inputField.text!)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputField?.resignFirstResponder()
    }
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.none
        dateFormatter.timeStyle = DateFormatter.Style.medium
        currentTimeDisplay.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func updateNotificationTime(sender: UIDatePicker) {
        var myDateComponents = DateComponents()
        myDateComponents.calendar = Calendar.current
    }
    @IBAction func updateNotificationPressed(_ sender: Any) {
        notifHour = Int(hourInput.text!)
        notifMin = Int(minuteInput.text!)
        
        dateComponents.calendar = Calendar.current
//            dateComponents.weekday = 7 // Tuesday
            dateComponents.hour = notifHour
            dateComponents.minute = notifMin
        
        let hourString = String(notifHour)
        let minString = String(notifMin)
            
        currentTimeDisplay.text = "\(hourString):\(minString)"
        
            let content = UNMutableNotificationContent()
            content.title = "Positive Reminder!"
            content.body = "Keep Calm and Carry On!"
            content.sound = UNNotificationSound.default
            
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
            let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
//            let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
            let request2 = UNNotificationRequest(identifier: "testCalender", content: content, trigger: trigger2)
            
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }
}
