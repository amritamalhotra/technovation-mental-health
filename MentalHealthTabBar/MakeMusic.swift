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
    var cSharpPlayer = AVAudioPlayer()
    var dPlayer = AVAudioPlayer()
    var dSharpPlayer = AVAudioPlayer()
    var ePlayer = AVAudioPlayer()
    var fPlayer = AVAudioPlayer()
    var fSharpPlayer = AVAudioPlayer()
    var gPlayer = AVAudioPlayer()
    var gSharpPlayer = AVAudioPlayer()
    var aPlayer = AVAudioPlayer()
    var aSharpPlayer = AVAudioPlayer()
    var bPlayer = AVAudioPlayer()
    var cTwoPlayer = AVAudioPlayer()
    
    let sounds = ["C1", "C#1", "D1", "D#1", "E1", "F1", "F#1", "G1", "G#1", "A1", "A#1", "B1", "C2"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let csound =  Bundle.main.path(forResource: "C1", ofType: "mp3")
        
        do {
            cPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: csound!))
            }
        catch {
            print(error)
        }
        let cSharpSound =  Bundle.main.path(forResource: "C#1", ofType: "mp3")
        
        do {
            cSharpPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: cSharpSound!))
            }
        catch {
            print(error)
        }
        let dsound =  Bundle.main.path(forResource: "D1", ofType: "mp3")
        
        do {
            dPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dsound!))
            }
        catch {
            print(error)
        }
        let dSharpSound =  Bundle.main.path(forResource: "D#1", ofType: "mp3")
        
        do {
            dSharpPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dSharpSound!))
            }
        catch {
            print(error)
        }
        let esound =  Bundle.main.path(forResource: "E1", ofType: "mp3")
        
        do {
            ePlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: esound!))
            }
        catch {
            print(error)
        }
        let fsound =  Bundle.main.path(forResource: "F1", ofType: "mp3")
        
        do {
            fPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fsound!))
            }
        catch {
            print(error)
        }
        let fSharpSound =  Bundle.main.path(forResource: "F#1", ofType: "mp3")
        
        do {
            fSharpPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fSharpSound!))
            }
        catch {
            print(error)
        }
        let gsound =  Bundle.main.path(forResource: "G1", ofType: "mp3")
        
        do {
            gPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: gsound!))
            }
        catch {
            print(error)
        }
        let gSharpSound =  Bundle.main.path(forResource: "G#1", ofType: "mp3")
        
        do {
            gSharpPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: gSharpSound!))
            }
        catch {
            print(error)
        }
        let asound =  Bundle.main.path(forResource: "A1", ofType: "mp3")
        
        do {
            aPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: asound!))
            }
        catch {
            print(error)
        }
        let aSharpSound =  Bundle.main.path(forResource: "A#1", ofType: "mp3")
        
        do {
            aSharpPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: aSharpSound!))
            }
        catch {
            print(error)
        }
        let bsound =  Bundle.main.path(forResource: "B1", ofType: "mp3")
        
        do {
            bPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bsound!))
            }
        catch {
            print(error)
        }
        let cTwoSound =  Bundle.main.path(forResource: "C2", ofType: "mp3")
        
        do {
            cTwoPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: cTwoSound!))
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
    @IBAction func cSPlay(_ sender: Any) {
        cSharpPlayer.play()
    }
    @IBAction func dPlay(_ sender: Any) {
        dPlayer.play()
    }
    @IBAction func dSPlay(_ sender: Any) {
        dSharpPlayer.play()
    }
    @IBAction func ePlay(_ sender: Any) {
        ePlayer.play()
    }
    @IBAction func fPlay(_ sender: Any) {
        fPlayer.play()
    }
    @IBAction func fSPlay(_ sender: Any) {
        fSharpPlayer.play()
    }
    @IBAction func gPlay(_ sender: Any) {
        gPlayer.play()
    }
    @IBAction func gSPlay(_ sender: Any) {
        gSharpPlayer.play()
    }
    @IBAction func aPlay(_ sender: Any) {
        aPlayer.play()
    }
    @IBAction func aSPlay(_ sender: Any) {
        aSharpPlayer.play()
    }
    @IBAction func bPlay(_ sender: Any) {
        bPlayer.play()
    }
    @IBAction func cTwoPlay(_ sender: Any) {
        cTwoPlayer.play()
    }
    @IBAction func cStop(_ sender: Any) {
        cPlayer.stop()
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

