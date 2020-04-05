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
    
    var cMajorPlayer = AVAudioPlayer()
    var cPentaPlayer = AVAudioPlayer()
    var cChordPlayer = AVAudioPlayer()
    var dChordPlayer = AVAudioPlayer()
    var eChordPlayer = AVAudioPlayer()
    var fChordPlayer = AVAudioPlayer()
 
    @IBOutlet weak var cb: UIButton!
    @IBOutlet weak var csb: UIButton!
    @IBOutlet weak var db: UIButton!
    @IBOutlet weak var dsb: UIButton!
    @IBOutlet weak var eb: UIButton!
    @IBOutlet weak var fb: UIButton!
    @IBOutlet weak var fsb: UIButton!
    @IBOutlet weak var gb: UIButton!
    @IBOutlet weak var gsb: UIButton!
    @IBOutlet weak var ab: UIButton!
    @IBOutlet weak var asb: UIButton!
    @IBOutlet weak var bb: UIButton!
    @IBOutlet weak var cb2: UIButton!

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
        
        let cScaleSound = Bundle.main.path(forResource: "C-Major-Scale", ofType: "mp3")
        
        do {
            cMajorPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: cScaleSound!))
        } catch {
            print(error)
        }
        
        let cPentaSound = Bundle.main.path(forResource: "C Pentatonic Scale", ofType: "mp3")
        
        do {
            cPentaPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: cPentaSound!))
        } catch {
            print(error)
        }
        
        let cChordSound = Bundle.main.path(forResource: "C Triad", ofType: "mp3")
        
        do {
            cChordPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: cChordSound!))
        } catch {
            print(error)
        }
        
        let dChordSound = Bundle.main.path(forResource: "D Triad", ofType: "mp3")
        
        do {
            dChordPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dChordSound!))
        } catch {
            print(error)
        }
        
        let eChordSound = Bundle.main.path(forResource: "E-Triad", ofType: "mp3")
        
        do {
            eChordPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: eChordSound!))
        } catch {
            print(error)
        }
        
        let fChordSound = Bundle.main.path(forResource: "F-Triad", ofType: "mp3")
        
        do {
            fChordPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fChordSound!))
        } catch {
            print(error)
        }
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
    
    @IBAction func cMajorPlay(_ sender: Any) {
        cMajorPlayer.play()
    }
    @IBAction func cPentatonicPlay(_ sender: Any) {
        cPentaPlayer.play()
    }
    @IBAction func cChordPlay(_ sender: Any) {
        cChordPlayer.play()
    }
    @IBAction func dChordPlay(_ sender: Any) {
        dChordPlayer.play()
    }
    @IBAction func eChordPlay(_ sender: Any) {
        eChordPlayer.play()
    }
    @IBAction func fChordPlay(_ sender: Any) {
        fChordPlayer.play()
    }
    
    @IBAction func showNoteNames(_ sender: Any) {
        cb.alpha = 1
        csb.alpha = 1
        db.alpha = 1
        dsb.alpha = 1
        eb.alpha = 1
        fb.alpha = 1
        fsb.alpha = 1
        gb.alpha = 1
        gsb.alpha = 1
        ab.alpha = 1
        asb.alpha = 1
        bb.alpha = 1
        cb2.alpha = 1
    }
    @IBAction func hideNoteNames(_ sender: Any) {
        cb.alpha = 0
        csb.alpha = 0
        db.alpha = 0
        dsb.alpha = 0
        eb.alpha = 0
        fb.alpha = 0
        fsb.alpha = 0
        gb.alpha = 0
        gsb.alpha = 0
        ab.alpha = 0
        asb.alpha = 0
        bb.alpha = 0
        cb2.alpha = 0
    }
    
    }
   

