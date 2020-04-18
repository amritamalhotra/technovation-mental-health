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
    
    var marimba1 = AVAudioPlayer()
    var marimba2 = AVAudioPlayer()
    var marimba3 = AVAudioPlayer()
    var marimba4 = AVAudioPlayer()
    var marimba5 = AVAudioPlayer()
    var marimba6 = AVAudioPlayer()
    
    var setting = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.alpha = 0
        timeExhaleLabel.alpha = 0
        let marimba1Sound =  Bundle.main.path(forResource: "segment 1", ofType: "mp3")
        
        do {
            marimba1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimba1Sound!))
            }
        catch {
            print(error)
        }
        let marimba2Sound =  Bundle.main.path(forResource: "segment 2", ofType: "mp3")
        
        do {
            marimba2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimba2Sound!))
            }
        catch {
            print(error)
        }
        let marimba3Sound =  Bundle.main.path(forResource: "segment-3", ofType: "mp3")
        
        do {
            marimba3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimba3Sound!))
            }
        catch {
            print(error)
        }
        let marimba4Sound =  Bundle.main.path(forResource: "segment-4", ofType: "mp3")
        
        do {
            marimba4 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimba4Sound!))
            }
        catch {
            print(error)
        }
        let marimba5Sound =  Bundle.main.path(forResource: "segment-5", ofType: "mp3")
        
        do {
            marimba5 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimba5Sound!))
            }
        catch {
            print(error)
        }
        let marimba6Sound =  Bundle.main.path(forResource: "segment-6", ofType: "mp3")
        
        do {
            marimba6 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: marimba6Sound!))
            }
        catch {
            print(error)
        }
    }
    
    @IBAction func updateSlider(_ sender: Any) {
        let value = Int(timeSlider.value)
        setting = value - 2
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
        if (setting == 1) {
            sleep(1)
            marimba1.play()
        } else if (setting == 2) {
            sleep(1)
            marimba2.play()
        } else if (setting == 3) {
            sleep(1)
            marimba3.play()
        } else if (setting == 4) {
            sleep(1)
            marimba4.play()
        } else if (setting == 5) {
            sleep(1)
            marimba5.play()
        } else if (setting == 6) {
            sleep(1)
            marimba6.play()
        }
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
