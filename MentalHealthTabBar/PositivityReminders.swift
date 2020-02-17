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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let center = UNUserNotificationCenter.current()
               center.requestAuthorization(options: [.alert, .sound])
               {
                   (granted, error) in
               }
               
               let content = UNMutableNotificationContent()
               content.title = "This is a notification!"
               content.body = "This is the body!"
               
               let date = Date().addingTimeInterval(5)
               
               
               _ = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
               
               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
               
               let uuidString = UUID().uuidString
               
               let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
               
               center.add(request) { (error) in
                   
               }
        // Do any additional setup after loading the view.
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
}
