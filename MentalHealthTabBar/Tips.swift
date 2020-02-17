//
//  Tips.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class Tips: UIViewController {
    
    @IBOutlet weak var selfHelp1: UITextField!
    @IBOutlet weak var selfHelp2: UITextField!
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selfHelp1.delegate = self
        selfHelp2.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func toReminders(sender: UIButton) {
        performSegue(withIdentifier: "NewController", sender: self)
    }
    
    @IBAction func enter(_ sender: Any) {
        result.text = "Self Help 1: \(selfHelp1.text!)\nSelf Help 2: \(selfHelp2.text!)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        selfHelp2.resignFirstResponder()
    }
}
extension UIViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
