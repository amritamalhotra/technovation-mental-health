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
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let sound = Bundle.main.path(forResource: "SampleAudio_0.4mb", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toMusicMaker(_ sender: UIButton) {
        performSegue(withIdentifier: "toMakeMusic", sender: self)
    }
    
    @IBAction func test(_ sender: Any) {
            audioPlayer.play()
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
