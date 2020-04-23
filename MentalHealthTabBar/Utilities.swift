//
//  Utilities.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 3/16/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class Utilities: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{6,}")
        return passwordTest.evaluate(with: password)
    }

}
