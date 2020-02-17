//
//  FirstViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/5/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var display: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func happyPressed(_ sender: Any) {
        display.text = "You chose: happy!"
    }
    @IBAction func sadPressed(_ sender: Any) {
        display.text = "You chose: sad"
    }
    @IBAction func stressedPressed(_ sender: Any) {
        display.text = "You chose: stressed"
    }
    @IBAction func boredPressed(_ sender: Any) {
        display.text = "You chose: bored"
    }
    @IBAction func anxiousPressed(_ sender: Any) {
        display.text = "You chose: anxious"
    }
    @IBAction func madPressed(_ sender: Any) {
        display.text = "You chose: mad"
    }
    
}

