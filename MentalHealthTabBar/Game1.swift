//
//  Game1.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import AVFoundation

class Game1: UIViewController {
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var displayedImage: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button2.alpha = 0
        button3.alpha = 0
        button4.alpha = 0
        button5.alpha = 0
        button6.alpha = 0
        button7.alpha = 0
        button8.alpha = 0
        button9.alpha = 0
        button10.alpha = 0
        
        let sound = Bundle.main.path(forResource: "SampleAudio_0.4mb", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gameOneToExercises(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func playHit(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func stopHit(_ sender: Any) {
        audioPlayer.stop()
    }
    
    @IBAction func button1Hit(_ sender: Any) {
        button2.alpha = 1
        button1.alpha = 0
        let image : UIImage = UIImage(named:"happyemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button2Hit(_ sender: Any) {
        button3.alpha = 1
        button2.alpha = 0
        let image : UIImage = UIImage(named:"sademoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button3Hit(_ sender: Any) {
        button4.alpha = 1
        button3.alpha = 0
        let image : UIImage = UIImage(named:"nervousemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button4Hit(_ sender: Any) {
        button5.alpha = 1
        button4.alpha = 0
        let image : UIImage = UIImage(named:"angryemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button5Hit(_ sender: Any) {
        button6.alpha = 1
        button5.alpha = 0
        let image : UIImage = UIImage(named:"mehemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button6Hit(_ sender: Any) {
        button7.alpha = 1
        button6.alpha = 0
        let image : UIImage = UIImage(named:"happyemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button7Hit(_ sender: Any) {
        button8.alpha = 1
        button7.alpha = 0
        let image : UIImage = UIImage(named:"sademoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button8Hit(_ sender: Any) {
        button9.alpha = 1
        button8.alpha = 0
        let image : UIImage = UIImage(named:"nervousemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button9Hit(_ sender: Any) {
        button10.alpha = 1
        button9.alpha = 0
        let image : UIImage = UIImage(named:"angryemoji1-1")!
        displayedImage.image = image
    }
    @IBAction func button10Hit(_ sender: Any) {
        print("Completed")
        let image : UIImage = UIImage(named:"mehemoji1-1")!
        displayedImage.image = image
    }
    
}
