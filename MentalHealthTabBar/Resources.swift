//
//  SecondViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/5/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameInfo: UITextField!
    @IBOutlet weak var numberInfo: UITextField!
    @IBOutlet weak var contactDisplay: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func enter(_ sender: Any) {
        contactDisplay.text = "current contact info\nName: \(nameInfo.text!)\nNumber: \(numberInfo.text!)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numberInfo.resignFirstResponder()
    }
    @IBAction func toPhoneNumbers( sender: Any) {
        performSegue(withIdentifier: "toPhone", sender: self)
    }
    @IBAction func makeTestCall(_ sender: Any) {
        let url:URL = URL(string: "tel://5107342459")!
        
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
}
