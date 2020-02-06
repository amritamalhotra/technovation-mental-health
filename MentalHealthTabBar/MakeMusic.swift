//
//  MakeMusic.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import AVFoundation

class MakeMusic: UIViewController {
    var cPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let csound = Bundle.main.path(forResource: "C1", ofType: "mp3")
        
        do {
            cPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: csound!))
            }
        catch {
            print(error)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMusic(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cPlay(_ sender: Any) {
        cPlayer.play()
    }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

