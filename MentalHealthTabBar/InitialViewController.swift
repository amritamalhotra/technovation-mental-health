//
//  InitialViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 3/16/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAccountButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        createAccountButton.layer.borderWidth = 2.5
        loginButton.layer.borderWidth = 2.5
        
    }

}
