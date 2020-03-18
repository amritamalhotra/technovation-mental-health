//
//  LoginViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 3/16/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
        errorLabel.alpha = 0
        loginButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 2.5
        loginButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // Validate Text Fields
        
        // Create cleaned versions of the text fields
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let myHomeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.realHomeView) as? UITabBarController
                
                self.view.window?.rootViewController = myHomeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
}
