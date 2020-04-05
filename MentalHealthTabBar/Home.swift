//
//  FirstViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/5/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import SQLite

class FirstViewController: UIViewController {

    @IBOutlet weak var display: UITextView!
    var database: Connection!
    let usersTable = Table("users")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
    }
    
    @IBAction func createTable(_ sender: Any) {
        let createTable = self.usersTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email, unique: true)
        }
        do {
            try self.database.run(createTable)
            print("Created the table")
        } catch {
            print(error)
        }
    }
    @IBAction func insertUserPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Insert User", message: "Message", preferredStyle: .alert)
        alert.addTextField{(tf) in tf.placeholder = "Name" }
        alert.addTextField{(tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else {return}
            print(name)
            print(email)
            
            let insertUser = self.usersTable.insert(self.name <- name, self.email <- email)
            do {
                try self.database.run(insertUser)
                print("Inserted user!")
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func deleteUserPressed(_ sender: Any) {
        let alert2 = UIAlertController(title: "Delete User", message: "Message", preferredStyle: .alert)
        alert2.addTextField{(tf) in tf.placeholder = "User ID" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIdString = alert2.textFields?.first?.text,
                let userId = Int(userIdString)
                else {return}
            print(userIdString)
            
            let user = self.usersTable.filter(self.id == userId)
            let deleteUser = user.delete()
            do {
                try self.database.run(deleteUser)
            } catch {
                print(error)
            }
        }
        alert2.addAction(action)
        present(alert2, animated: true, completion: nil)
    }
    @IBAction func updateUser(_ sender: Any) {
        let alert3 = UIAlertController(title: "Update User", message: "Message", preferredStyle: .alert)
        alert3.addTextField{(tf) in tf.placeholder = "User ID" }
        alert3.addTextField{(tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIdString = alert3.textFields?.first?.text,
                let userId = Int(userIdString),
                let email = alert3.textFields?.last?.text
                else {return}
            print(userIdString)
            print(email)
            
            let user = self.usersTable.filter(self.id == userId)
            let updateUser = user.update(self.email <- email)
            do {
                try self.database.run(updateUser)
            } catch {
                print(error)
            }
            
        }
        alert3.addAction(action)
        present(alert3, animated: true, completion: nil)
    }
    @IBAction func listUsers(_ sender: Any) {
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.email])")
            }
        } catch {
            print(error)
        }
    }
    @IBAction func happyPressed(_ sender: Any) {
        Emotions.shared.theEmotion = "happy!"
        Emotions.shared.theTip = "This is a happy tip. It will state how to stay happy, how to improve your life, and how to help others become happy."
        display.text = "Your current emotion: \(Emotions.shared.theEmotion)"
    }
    @IBAction func sadPressed(_ sender: Any) {
        display.text = "Your current emotion: sad"
        Emotions.shared.theEmotion = "sad"
        Emotions.shared.theTip = "This is a sad tip. It will state how to become happier and how it's ok to be sad sometimes and you can still be happy."
    }
    @IBAction func stressedPressed(_ sender: Any) {
        display.text = "Your current emotion: stressed"
        Emotions.shared.theEmotion = "stressed"
        Emotions.shared.theTip = "This is a stressed tip. It will state how to keep calm and get rid of stress-inducers in your life to be happy!"
    }
    @IBAction func boredPressed(_ sender: Any) {
        display.text = "Your current emotion: bored"
        Emotions.shared.theEmotion = "bored"
        Emotions.shared.theTip = "This is a bored tip. It will state different ideas of how to occupy yourself and how you can be happy."
    }
    @IBAction func anxiousPressed(_ sender: Any) {
        display.text = "Your current emotion: anxious"
        Emotions.shared.theEmotion = "anxious"
        Emotions.shared.theTip = "This is an anxious tip. It will state how to keep calm even in the most sketchy of situations and how anxiety can be controlled."
    }
    @IBAction func madPressed(_ sender: Any) {
        display.text = "Your current emotion: mad"
        Emotions.shared.theEmotion = "mad"
        Emotions.shared.theTip = "This is a mad tip. It will state how to stay calm and not injure anybody or yourself when things aren't going your way."
    }
}
