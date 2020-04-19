//
//  Game2.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import AVFoundation

class Game2: UIViewController {
    
    var riverPlayer = AVAudioPlayer()
    var birdPlayer = AVAudioPlayer()
    @IBOutlet weak var flyingBird: UIImageView!
    @IBOutlet weak var flyingBird2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let riversound =  Bundle.main.path(forResource: "river flowing", ofType: "mp3")
        
        do {
            riverPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: riversound!))
            }
        catch {
            print(error)
        }
        let birdsound =  Bundle.main.path(forResource: "birds chirping", ofType: "mp3")
        
        do {
            birdPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: birdsound!))
            }
        catch {
            print(error)
        }
    }
    
    @IBAction func gameTwoToExercises(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func flyBird(_ sender: Any) {
        birdPlayer.play()
        while (flyingBird.frame.origin.x > -50 && flyingBird.frame.origin.y > -50) {
        let xPosition = flyingBird.frame.origin.x - 50
        let yPosition = flyingBird.frame.origin.y - 30
        let width = flyingBird.frame.size.width
        let height = flyingBird.frame.size.height
        UIImageView.animate(withDuration: 4.0, animations: {
            self.flyingBird.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
        }
    }
    @IBAction func flyBird2(_ sender: Any) {
        birdPlayer.play()
        while (flyingBird2.frame.origin.x > -50 && flyingBird2.frame.origin.y > -50) {
        let xPosition = flyingBird2.frame.origin.x - 20
        let yPosition = flyingBird2.frame.origin.y - 50
        let width = flyingBird2.frame.size.width
        let height = flyingBird2.frame.size.height
        UIImageView.animate(withDuration: 4.0, animations: {
            self.flyingBird2.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
        }
    }
    
    @IBAction func resetScene(_ sender: Any) {
        flyingBird.frame.origin.x = 328
        flyingBird.frame.origin.y = 222
        flyingBird2.frame.origin.x = 159
        flyingBird2.frame.origin.y = 254
    }
    @IBAction func stopSound(_ sender: Any) {
        riverPlayer.stop()
    }
    @IBAction func playSound(_ sender: Any) {
        riverPlayer.play()
    }
    
}
