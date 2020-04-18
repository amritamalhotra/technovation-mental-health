//
//  FirstViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/5/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import SQLite

class FirstViewController: UIViewController {

    @IBOutlet weak var display: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func happyPressed(_ sender: Any) {
        Emotions.shared.theEmotion = "happy!"
        Emotions.shared.theTip = "Giving back to others can be rewarding. Also, try a new activity, such as drawing or writing in a journal."
        display.text = "Happy: Recommended Exercises:\nPlay on the keyboard on the Music page!\n\nWrite in your journal on the Exercises page!\n\nListen to some music on the Music page!"
    }
    @IBAction func sadPressed(_ sender: Any) {
        display.text = "Sad: Recommended Exercises:\nExplore the nature scene on the Exercises page!\n\nListen to some music on the Music page!\n\nTry guided breathing on the Exercises page!"
        Emotions.shared.theEmotion = "sad"
        Emotions.shared.theTip = "Try going outside to exercise or enjoy nature. If you need to talk to someone, don’t be afraid to ask for help."
    }
    @IBAction func stressedPressed(_ sender: Any) {
        display.text = "Stressed: Recommended Exercises:\nTry guided breathing on the Exercises page!\n\nPlay some music on the Music page!\n\nWrite in your journal on the Exercises page!"
        Emotions.shared.theEmotion = "stressed"
        Emotions.shared.theTip = "Take a short break to check in with your feelings. Spending some time in nature or with friends can help relieve stress."
    }
    @IBAction func boredPressed(_ sender: Any) {
        display.text = "Bored: Recommended Exercises:\nTry the clicking game on the Exercises page!\n\nExplore the nature scene on the Exercises page!\n\nWrite in your journal on the Exercises page!"
        Emotions.shared.theEmotion = "bored"
        Emotions.shared.theTip = "Play a game or listen to some music. Helping others is also a good way to make your day positive and productive."
    }
    @IBAction func anxiousPressed(_ sender: Any) {
        display.text = "Anxious: Recommended Exercises:\nTry guided breathing on the Exercises page!\n\nListen to some music on the Music page!\n\nPlay the clicking game on the Exercises page!"
        Emotions.shared.theEmotion = "anxious"
        Emotions.shared.theTip = "Close your eyes. Spend some time in nature, and talk about your worries if you’re too overwhelmed."
    }
    @IBAction func madPressed(_ sender: Any) {
        display.text = "Mad: Recommended Exercises:\nPlay the clicking game on the Exercises page!\n\nPlay on the keyboard on the Music page!\n\nTry guided breathing on the Exercises page!"
        Emotions.shared.theEmotion = "mad"
        Emotions.shared.theTip = "Take a few deep breaths and find a safe way to let out your anger. Distract yourself by playing a game."
    }
}
