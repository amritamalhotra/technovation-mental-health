//
//  Exercises.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class Exercises: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func guidedbreathing(_ sender: UIButton) {
        performSegue(withIdentifier: "toBreathing", sender: self)
    }
    
    @IBAction func journal(_ sender: UIButton) {
        performSegue(withIdentifier: "toJournal", sender: self)
    }
    
    @IBAction func gameOne(_ sender: UIButton) {
        performSegue(withIdentifier: "toGameOne", sender: self)
    }
    
    @IBAction func gameTwo(_ sender: UIButton) {
        performSegue(withIdentifier: "toGameTwo", sender: self)
    }
}
