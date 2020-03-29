//
//  Music.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import AVFoundation

class Music: UIViewController {
    var h1Player = AVAudioPlayer()
    var h2Player = AVAudioPlayer()
    var sad1Player = AVAudioPlayer()
    var sad2Player = AVAudioPlayer()
    var str1Player = AVAudioPlayer()
    var str2Player = AVAudioPlayer()
    var bor1Player = AVAudioPlayer()
    var bor2Player = AVAudioPlayer()
    var mad1Player = AVAudioPlayer()
    var mad2Player = AVAudioPlayer()
    var anx1Player = AVAudioPlayer()
    var anx2Player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let h1sound =  Bundle.main.path(forResource: "HappyOne", ofType: "mp3")
        
        do {
            h1Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: h1sound!))
            }
        catch {
            print(error)
        }
        let h2sound =  Bundle.main.path(forResource: "HappyTwo", ofType: "mp3")
        
        do {
            h2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: h2sound!))
            }
        catch {
            print(error)
        }
        let sad1sound =  Bundle.main.path(forResource: "SadOne", ofType: "mp3")
        
        do {
            sad1Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sad1sound!))
            }
        catch {
            print(error)
        }
        let sad2sound =  Bundle.main.path(forResource: "SadTwo", ofType: "mp3")
        
        do {
            sad2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sad2sound!))
            }
        catch {
            print(error)
        }
        let str1sound =  Bundle.main.path(forResource: "StressedOne", ofType: "mp3")
        
        do {
            str1Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: str1sound!))
            }
        catch {
            print(error)
        }
        let str2sound =  Bundle.main.path(forResource: "StressedTwo", ofType: "mp3")
        
        do {
            str2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: str2sound!))
            }
        catch {
            print(error)
        }
        let bor1sound =  Bundle.main.path(forResource: "BoredOne", ofType: "mp3")
        
        do {
            bor1Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bor1sound!))
            }
        catch {
            print(error)
        }
        let bor2sound =  Bundle.main.path(forResource: "BoredTwo", ofType: "mp3")
        
        do {
            bor2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bor2sound!))
            }
        catch {
            print(error)
        }
        let mad1sound =  Bundle.main.path(forResource: "MadOne", ofType: "mp3")
        
        do {
            mad1Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: mad1sound!))
            }
        catch {
            print(error)
        }
        let mad2sound =  Bundle.main.path(forResource: "MadTwo", ofType: "mp3")
        
        do {
            mad2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: mad2sound!))
            }
        catch {
            print(error)
        }
        let anx1sound =  Bundle.main.path(forResource: "AnxiousOne", ofType: "mp3")
        
        do {
            anx1Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: anx1sound!))
            }
        catch {
            print(error)
        }
        let anx2sound =  Bundle.main.path(forResource: "AnxiousTwo", ofType: "mp3")
        
        do {
            anx2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: anx2sound!))
            }
        catch {
            print(error)
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func music1Play(_ sender: Any) {
        let currentEmotion = Emotions.shared.theEmotion
        if (currentEmotion == "happy!") {
            h1Player.play()
        }
        else if (currentEmotion == "sad") {
            sad1Player.play()
        }
        if (currentEmotion == "stressed") {
            str1Player.play()
        }
        if (currentEmotion == "bored") {
            bor1Player.play()
        }
        if (currentEmotion == "mad") {
            mad1Player.play()
        }
        if (currentEmotion == "anxious") {
            anx1Player.play()
        }
    }
    @IBAction func music2Play(_ sender: Any) {
        let currentEmotion = Emotions.shared.theEmotion
        if (currentEmotion == "happy!") {
            h2Player.play()
        }
        if (currentEmotion == "sad") {
            sad2Player.play()
        }
        if (currentEmotion == "stressed") {
            str2Player.play()
        }
        if (currentEmotion == "bored") {
            bor2Player.play()
        }
        if (currentEmotion == "mad") {
            mad2Player.play()
        }
        if (currentEmotion == "anxious") {
            anx2Player.play()
        }
    }
    
    @IBAction func toMusicMaker(_ sender: UIButton) {
        performSegue(withIdentifier: "toMakeMusic", sender: self)
    }
}
