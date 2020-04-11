//
//  GuidedBreathing.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    var marimba = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.alpha = 0
        timeExhaleLabel.alpha = 0
        
        let marimbaSound =  Bundle.main.path(forResource: "marimba timer", ofType: "mp3")
        
        do {
            marimba = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimbaSound!))
            }
        catch {
            print(error)
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateSlider(_ sender: Any) {
        let value = Int(timeSlider.value)
        var exValue:Int
        if value <= 6 {
            exValue = Int(timeSlider.value) * 2
        } else {
            exValue = 12
        }
        sliderValueLabel.text! = "Inhale for " + String(value) + " seconds"
        sliderExhaleLabel.text! = "Exhale for " + String(exValue) + " seconds"
        timeLeft = value
        exTimeLeft = exValue
    }
    
    @objc func updateTimeLabel() {
        timeLabel.alpha = 1
        timeValue += 1
        timeLeft -= 1
        self.timeLabel.text! = "Breathe in: " + String(Int(timeValue))
        if timeLeft <= 0 {
            myTimer.invalidate()
            myTimer = nil
            myExTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateExTimeLabel), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateExTimeLabel() {
        timeLabel.alpha = 0
        timeExhaleLabel.alpha = 1
        exTimeValue += 1
        exTimeLeft -= 1
        self.timeExhaleLabel.text! = "Breathe out: " + String(Int(exTimeValue))
        if exTimeLeft <= 0 {
            myExTimer.invalidate()
            myExTimer = nil
        }
    }
    
    @IBAction func backGames(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func beginBreathing(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        marimba.play()
        wipeData()
    }
    
    @IBAction func wipeData() {
        timeLabel.alpha = 0
        timeExhaleLabel.alpha = 0
        timeValue = 0.0
        exTimeValue = 0.0
        timeLeft = Int(timeSlider.value)
        if timeLeft <= 6 {
            exTimeLeft = Int(timeSlider.value) * 2
        } else {
            exTimeLeft = 12
        }
    }
}
