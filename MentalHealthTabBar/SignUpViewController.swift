//
//  SignUpViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 3/16/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        createAccountButton.layer.cornerRadius = 15
        createAccountButton.layer.borderWidth = 2.5
        createAccountButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // returns nil if everything is correct, error message if incorrect
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        
        if  passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 6 characters long."
        }
        
        return nil
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        if error != nil {
            
            // Something wrong with fields, show error message
            showError(error!)
        }
        else {
            // Create cleaned versions of the data
            let email = self.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    // There was an error
                    self.showError("Error creating user")
                }
                else {
                    
                    // User created successfully
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["uid": result!.user.uid]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
            
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let myHomeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.realHomeView) as? UITabBarController
        
        view.window?.rootViewController = myHomeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
