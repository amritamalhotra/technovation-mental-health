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
    var message = "You can do it!!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageDisplay.text = message
    }
    
    @IBAction func goback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func setDefaultMessage(_ sender: Any) {
        message = "Keep Calm and Carry On!"
        messageDisplay.text = "Current Message:\n\(message)"
    }
    @IBAction func enterPressed(_ sender: Any) {
        message = inputField.text!
        messageDisplay.text = "Current Message:\n\(message)"
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
    
//    @IBAction func loadData(_ sender: Any) {
//        let defaults = UserDefaults()
//        let loadedHour = defaults.object(forKey: "hour") as! Int
//        let loadedMin = defaults.object(forKey: "minute") as! Int
//        currentTimeDisplay.text = "This is the loaded data + \(loadedHour) + \(loadedMin)"
//    }
    
    @IBAction func updateNotificationPressed(_ sender: Any) {
//        var savedHour:NSInteger
//        var savedMinute:NSInteger
        var sHour:Int
        var sMin:Int
        sHour = Int(hourInput.text!)!
//        savedHour = sHour
        sMin = Int(minuteInput.text!)!
//        savedMinute = sMin
        
//        let defaults = UserDefaults()
//        defaults.set(savedHour, forKey: "hour")
//        defaults.set(savedMinute, forKey: "minute")
        
        let hour = String(sHour)
        var minute:String
        if (sMin < 10) {
            minute = "0" + String(sMin)
        } else {
            minute = String(sMin)
        }
        currentTimeDisplay.text = "\(hour):\(minute)"
        
        var realDateComponents = DateComponents()
        realDateComponents.calendar = Calendar.current
                        
        //notifHour = Int(loadedHour)
        //notifMin = Int(loadedMin)
        
        realDateComponents.day = 1
        realDateComponents.hour = sHour
        realDateComponents.minute = sMin
                        
        let realContent = UNMutableNotificationContent()
        realContent.title = "Positive Reminder!"
        realContent.body = message
        realContent.sound = UNNotificationSound.default
                            
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: realDateComponents, repeats: true)
                            
        //let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        let request2 = UNNotificationRequest(identifier: "testCalender", content: realContent, trigger: trigger2)
                            
        //UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }
}
