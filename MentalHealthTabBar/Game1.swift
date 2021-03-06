//
//  Game1.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class Game1: UIViewController {
    
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
        
    }
    
    @IBAction func gameOneToExercises(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func button1Hit(_ sender: Any) {
        button2.alpha = 1
        button1.alpha = 0
        let image : UIImage = UIImage(named:"smashgame1")!
        displayedImage.image = image
    }
    @IBAction func button2Hit(_ sender: Any) {
        button3.alpha = 1
        button2.alpha = 0
        let image : UIImage = UIImage(named:"smashgame2")!
        displayedImage.image = image
    }
    @IBAction func button3Hit(_ sender: Any) {
        button4.alpha = 1
        button3.alpha = 0
        let image : UIImage = UIImage(named:"smashgame3")!
        displayedImage.image = image
    }
    @IBAction func button4Hit(_ sender: Any) {
        button5.alpha = 1
        button4.alpha = 0
        let image : UIImage = UIImage(named:"smashgame4")!
        displayedImage.image = image
    }
    @IBAction func button5Hit(_ sender: Any) {
        button6.alpha = 1
        button5.alpha = 0
        let image : UIImage = UIImage(named:"smashgame5")!
        displayedImage.image = image
    }
    @IBAction func button6Hit(_ sender: Any) {
        button7.alpha = 1
        button6.alpha = 0
        let image : UIImage = UIImage(named:"smashgame6")!
        displayedImage.image = image
    }
    @IBAction func button7Hit(_ sender: Any) {
        button8.alpha = 1
        button7.alpha = 0
        let image : UIImage = UIImage(named:"smashgame7")!
        displayedImage.image = image
    }
    @IBAction func button8Hit(_ sender: Any) {
        button9.alpha = 1
        button8.alpha = 0
        let image : UIImage = UIImage(named:"smashgame8")!
        displayedImage.image = image
    }
    @IBAction func button9Hit(_ sender: Any) {
        button10.alpha = 1
        button9.alpha = 0
        let image : UIImage = UIImage(named:"smashgame9")!
        displayedImage.image = image
    }
    @IBAction func button10Hit(_ sender: Any) {
        print("Completed")
        let image : UIImage = UIImage(named:"smashgame10")!
        displayedImage.image = image
        button10.alpha = 0
    }
    
    @IBAction func startOver(_ sender: Any) {
        button1.alpha = 1
        button2.alpha = 0
        button3.alpha = 0
        button4.alpha = 0
        button5.alpha = 0
        button6.alpha = 0
        button7.alpha = 0
        button8.alpha = 0
        button9.alpha = 0
        button10.alpha = 0
        displayedImage.image = nil
    }
}
