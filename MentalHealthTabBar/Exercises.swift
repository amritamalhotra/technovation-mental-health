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

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
