//
//  Game2.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class Game2: UIViewController {
    
    @IBOutlet weak var flyingBird: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gameTwoToExercises(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func flyBird(_ sender: Any) {
        while ((flyingBird.frame.origin.x > 0) && (flyingBird.frame.origin.y > 0)) {
        let xPosition = flyingBird.frame.origin.x - 10
        let yPosition = flyingBird.frame.origin.y - 20
        let width = flyingBird.frame.size.width
        let height = flyingBird.frame.size.height
            UIImageView.animate(withDuration: 5.0, animations: {
            self.flyingBird.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
        }
    }
}
