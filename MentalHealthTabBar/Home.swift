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
        Emotions.shared.theTip = "This is a happy tip. It will state how to stay happy, how to improve your life, and how to help others become happy."
        display.text = "Happy: Recommended Exercises:\nPlay on the keyboard on the Music page!\n\nWrite in your journal on the Exercises page!\n\nListen to some music on the Music page!"
    }
    @IBAction func sadPressed(_ sender: Any) {
        display.text = "Sad: Recommended Exercises:\nExplore the nature scene on the Exercises page!\n\nListen to some music on the Music page!\n\nTry guided breathing on the Exercises page!"
        Emotions.shared.theEmotion = "sad"
        Emotions.shared.theTip = "This is a sad tip. It will state how to become happier and how it's ok to be sad sometimes and you can still be happy."
    }
    @IBAction func stressedPressed(_ sender: Any) {
        display.text = "Stressed: Recommended Exercises:\nTry guided breathing on the Exercises page!\n\nPlay some music on the Music page!\n\nWrite in your journal on the Exercises page!"
        Emotions.shared.theEmotion = "stressed"
        Emotions.shared.theTip = "This is a stressed tip. It will state how to keep calm and get rid of stress-inducers in your life to be happy!"
    }
    @IBAction func boredPressed(_ sender: Any) {
        display.text = "Bored: Recommended Exercises:\n"
        Emotions.shared.theEmotion = "bored"
        Emotions.shared.theTip = "This is a bored tip. It will state different ideas of how to occupy yourself and how you can be happy."
    }
    @IBAction func anxiousPressed(_ sender: Any) {
        display.text = "Your current emotion: anxious"
        Emotions.shared.theEmotion = "anxious"
        Emotions.shared.theTip = "This is an anxious tip. It will state how to keep calm even in the most sketchy of situations and how anxiety can be controlled."
    }
    @IBAction func madPressed(_ sender: Any) {
        display.text = "Your current emotion: mad"
        Emotions.shared.theEmotion = "mad"
        Emotions.shared.theTip = "This is a mad tip. It will state how to stay calm and not injure anybody or yourself when things aren't going your way."
    }
}
