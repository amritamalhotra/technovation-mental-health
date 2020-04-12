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
    
    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var description2: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
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
    
    @IBAction func getMyMusic(_ sender: Any) {
        if (Emotions.shared.theEmotion == "happy!") {
            description1.text = "You Are My Sunshine/Isn’t She Lovely is a fun, lighthearted medley arranged for marimba and kalimba"
            description2.text = "Sonata No. 3 Opening by Clementi - This famous sonata begins with a jumpy, brisk tune on piano"
            let image : UIImage = UIImage(named:"note1yellow")!
            image1.image = image
            let imagetwo : UIImage = UIImage(named:"note2yellow")!
            image2.image = imagetwo
        }
        if (Emotions.shared.theEmotion == "sad") {
            description1.text = "Here’s That Rainy Day by 21 Trombones is a gentle jazz piece arranged for 21 of the best trombonists of its time"
            description2.text = "Pavane of the Sleeping Beauty by Ravel - This tranquil piece is known for its haunting yet beautiful melody on piano"
            let image : UIImage = UIImage(named:"note1blue")!
            image1.image = image
            let imagetwo : UIImage = UIImage(named:"note2blue")!
            image2.image = imagetwo
        }
        if (Emotions.shared.theEmotion == "mad") {
            description1.text = "The ‘Revolutionary’ Etude Op. 10 No. 12 in C Minor by Chopin is a short yet dynamic piece for solo piano"
            description2.text = "The Cat and The Mouse by Aaron Copland is a highly energetic, sporadic piece for piano"
            let image : UIImage = UIImage(named:"note1red")!
            image1.image = image
            let imagetwo : UIImage = UIImage(named:"note2red")!
            image2.image = imagetwo
        }
        if (Emotions.shared.theEmotion == "anxious") {
            description1.text = "Capricho Catalán by Isaac Albéniz is a moving yet calming piece arranged for solo classical guitar"
            description2.text = "Memory by Andrew Lloyd Webber from “Cats” - This famous melody is known for its relaxing chords"
            let image : UIImage = UIImage(named:"note1yorange")!
            image1.image = image
            let imagetwo : UIImage = UIImage(named:"note2orange")!
            image2.image = imagetwo
        }
        if (Emotions.shared.theEmotion == "stressed") {
            description1.text = "Prelude No. 1 in C Major from the Well-Tempered Clavier by Bach is a relaxing melody with beautifully moving chords"
            description2.text = "Mozart's Sonata No. 8 D major mov. III - This calming piece is both engaging and refreshing on piano"
            let image : UIImage = UIImage(named:"note1purple")!
            image1.image = image
            let imagetwo : UIImage = UIImage(named:"note2purple")!
            image2.image = imagetwo
        }
        if (Emotions.shared.theEmotion == "bored") {
            description1.text = "Children’s Corner Doctor Gradus ad Parnassum by Debussy is an entertaining and quick tune for solo piano"
            description2.text = "Waltz in A minor by Chopin - This famous waltz is a soft but engaging piece written for piano"
            let image : UIImage = UIImage(named:"note1ygray")!
            image1.image = image
            let imagetwo : UIImage = UIImage(named:"note2gray")!
            image2.image = imagetwo
        }
    }
    
    @IBAction func toMusicMaker(_ sender: UIButton) {
        performSegue(withIdentifier: "toMakeMusic", sender: self)
    }
}
