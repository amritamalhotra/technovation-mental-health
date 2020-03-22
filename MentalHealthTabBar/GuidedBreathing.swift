//
//  GuidedBreathing.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class GuidedBreathing: UIViewController {

    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var sliderExhaleLabel: UILabel!
    @IBOutlet weak var timeExhaleLabel: UILabel!
    
    var timeValue = 0.0
    var exTimeValue = 0.0
    var timeLeft = 6
    var exTimeLeft = 12
    var myTimer: Timer!
    var myExTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateSlider(_ sender: Any) {
        let value = Int(timeSlider.value)
        let exValue = Int(timeSlider.value) * 2
        sliderValueLabel.text! = "Inhale for " + String(value) + " seconds"
        sliderExhaleLabel.text! = "Exhale for " + String(exValue) + " seconds"
        timeLeft = value
        exTimeLeft = exValue
        print(timeLeft)
        print(exTimeLeft)
    }
    
    
    @objc func updateTimeLabel() {
        timeValue += 1
        timeLeft -= 1
        self.timeLabel.text! = "Breathe in: " + String(timeValue)
        if timeLeft <= 0 {
            myTimer.invalidate()
            myTimer = nil
            print("Completed!")
            myExTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateExTimeLabel), userInfo: nil, repeats: true)        }
    }
    
    @objc func updateExTimeLabel() {
        exTimeValue += 1
        exTimeLeft -= 1
        self.timeExhaleLabel.text! = "Breathe out: " + String(exTimeValue)
        if exTimeLeft <= 0 {
            myExTimer.invalidate()
            myExTimer = nil
            print("Exhale done!")
        }
    }
    
    @IBAction func backGames(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func beginBreathing(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
//        if timeLeft <= 0 {
//            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateExTimeLabel), userInfo: nil, repeats: true)
//        }
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
