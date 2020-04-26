//
//  SecondViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/5/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import SQLite

class SecondViewController: UIViewController {
    
    var database: Connection!
    let contactTable = Table("contacts")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let number = Expression<Int>("number")
    
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var nashLabel: UILabel!
    @IBOutlet weak var nsphLabel: UILabel!
    @IBOutlet weak var nameInfo: UITextField!
    @IBOutlet weak var numberInfo: UITextField!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var enterEdit: UIButton!
    @IBOutlet weak var contactDisplay: UITextView!
    @IBOutlet weak var addContactButton: UIButton!
    @IBOutlet weak var editContactButton: UIButton!
    @IBOutlet weak var splButton: UIButton!
    @IBOutlet weak var adaaButton: UIButton!
    @IBOutlet weak var aofhButton: UIButton!
    @IBOutlet weak var NASHbutton: UIButton!
    @IBOutlet weak var NSPHbutton: UIButton!
    @IBOutlet weak var SCCbutton: UIButton!
    @IBOutlet weak var ANYCbutton: UIButton!
    @IBOutlet weak var callContactButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInfo.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("contacts").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
        
        let createContact = self.contactTable.create {(table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.number, unique: true)
        }
        do {
            try self.database.run(createContact)
            print("Created contact")
        } catch {
            print(error)
        }
        
        splButton.layer.cornerRadius = 10
        adaaButton.layer.cornerRadius = 10
        aofhButton.layer.cornerRadius = 10
        NASHbutton.layer.cornerRadius = 10
        NSPHbutton.layer.cornerRadius = 10
        SCCbutton.layer.cornerRadius = 10
        ANYCbutton.layer.cornerRadius = 10
        callContactButton.layer.borderWidth = 2
        callContactButton.layer.borderColor = UIColor.red.cgColor
        splButton.layer.borderColor = UIColor.black.cgColor
        adaaButton.layer.borderColor = UIColor.black.cgColor
        aofhButton.layer.borderColor = UIColor.black.cgColor
        NASHbutton.layer.borderColor = UIColor.black.cgColor
        NSPHbutton.layer.borderColor = UIColor.black.cgColor
        SCCbutton.layer.borderColor = UIColor.black.cgColor
        ANYCbutton.layer.borderColor = UIColor.black.cgColor
        
        nameInfo.alpha = 0
        numberInfo.alpha = 0
        enter.alpha = 0
        enterEdit.alpha = 0
    }
    @IBAction func addEmergencyContact(_ sender: Any) {
        cancelButton.alpha = 1
        nameInfo.alpha = 1
        numberInfo.alpha = 1
        enter.alpha = 1
        enterEdit.alpha = 0
        helpLabel.alpha = 0
        webLabel.alpha = 0
        nashLabel.alpha = 0
        nsphLabel.alpha = 0
        splButton.alpha = 0
        adaaButton.alpha = 0
        aofhButton.alpha = 0
        NASHbutton.alpha = 0
        NSPHbutton.alpha = 0
        SCCbutton.alpha = 0
        ANYCbutton.alpha = 0
        callContactButton.alpha = 0
        nameInfo.frame.origin.x = 24
        nameInfo.frame.origin.y = 78
        numberInfo.frame.origin.x = 64
        numberInfo.frame.origin.y = 125
        enter.frame.origin.x = 171
        enter.frame.origin.y = 171
    }
    @IBAction func editContact(_ sender: Any) {
        cancelButton.alpha = 1
        nameInfo.alpha = 1
        numberInfo.alpha = 1
        enterEdit.alpha = 1
        enter.alpha = 0
        helpLabel.alpha = 0
        webLabel.alpha = 0
        nashLabel.alpha = 0
        nsphLabel.alpha = 0
        splButton.alpha = 0
        adaaButton.alpha = 0
        aofhButton.alpha = 0
        NASHbutton.alpha = 0
        NSPHbutton.alpha = 0
        SCCbutton.alpha = 0
        ANYCbutton.alpha = 0
        callContactButton.alpha = 0
        nameInfo.frame.origin.x = 24
        nameInfo.frame.origin.y = 78
        numberInfo.frame.origin.x = 64
        numberInfo.frame.origin.y = 125
        enterEdit.frame.origin.x = 171
        enterEdit.frame.origin.y = 171
    }
    @IBAction func viewContact(_ sender: Any) {
        do {
        let contacts = try self.database.prepare(self.contactTable)
        for contact in contacts {
            if contact[self.id] == 1 {
            contactDisplay.text = "current contact info: \nName: \(contact[self.name])\nPhone Number: \(contact[self.number])"
                }
            }
        } catch {
            print(error)
        }
    }
    @IBAction func editUser(_ sender: Any) {
        let contactID = 1
        let name = nameInfo.text!
        let number = Int(numberInfo.text!)!
        
        let contact = self.contactTable.filter(self.id == contactID)
        let updateContact = contact.update(self.name <- name, self.number <- number)
        do {
            try self.database.run(updateContact)
        } catch {
            print(error)
        }
        do {
        let contacts = try self.database.prepare(self.contactTable)
        for contact in contacts {
            if contact[self.id] == 1 {
            contactDisplay.text = "current contact info: \nName: \(contact[self.name])\nPhone Number: \(contact[self.number])"
                }
            }
        } catch {
            print(error)
        }
        nameInfo.alpha = 0
        numberInfo.alpha = 0
        enterEdit.alpha = 0
        cancelButton.alpha = 0
        helpLabel.alpha = 1
        webLabel.alpha = 1
        nashLabel.alpha = 1
        nsphLabel.alpha = 1
        splButton.alpha = 1
        adaaButton.alpha = 1
        aofhButton.alpha = 1
        NASHbutton.alpha = 1
        NSPHbutton.alpha = 1
        SCCbutton.alpha = 1
        ANYCbutton.alpha = 1
        callContactButton.alpha = 1
        nameInfo.frame.origin.x = 24
        nameInfo.frame.origin.y = 436
        numberInfo.frame.origin.x = 60
        numberInfo.frame.origin.y = 477
        enterEdit.frame.origin.x = 170
        enterEdit.frame.origin.y = 513
    }
    @IBAction func cancel(_ sender: Any) {
        nameInfo.alpha = 0
        numberInfo.alpha = 0
        enterEdit.alpha = 0
        enter.alpha = 0
        helpLabel.alpha = 1
        webLabel.alpha = 1
        nashLabel.alpha = 1
        nsphLabel.alpha = 1
        splButton.alpha = 1
        adaaButton.alpha = 1
        aofhButton.alpha = 1
        NASHbutton.alpha = 1
        NSPHbutton.alpha = 1
        SCCbutton.alpha = 1
        ANYCbutton.alpha = 1
        callContactButton.alpha = 1
        nameInfo.frame.origin.x = 24
        nameInfo.frame.origin.y = 436
        numberInfo.frame.origin.x = 60
        numberInfo.frame.origin.y = 477
        enterEdit.frame.origin.x = 170
        enterEdit.frame.origin.y = 513
        enter.frame.origin.x = 170
        enter.frame.origin.y = 513
    }
    @IBAction func enter(_ sender: Any) {
        let name = nameInfo.text!
        let number = Int(numberInfo.text!)
        print(name)
        print(number!)
        
        let insertContact = self.contactTable.insert(self.name <- name, self.number <- number!)
        do {
            try self.database.run(insertContact)
            print("inserted contact!")
        } catch {
            print(error)
        }
        contactDisplay.text = "current contact info:\nName: \(name)\nNumber: \(number!)"
        
        nameInfo.alpha = 0
        numberInfo.alpha = 0
        enter.alpha = 0
        cancelButton.alpha = 0
        helpLabel.alpha = 1
        webLabel.alpha = 1
        nashLabel.alpha = 1
        nsphLabel.alpha = 1
        splButton.alpha = 1
        adaaButton.alpha = 1
        aofhButton.alpha = 1
        NASHbutton.alpha = 1
        NSPHbutton.alpha = 1
        SCCbutton.alpha = 1
        ANYCbutton.alpha = 1
        callContactButton.alpha = 1
        nameInfo.frame.origin.x = 24
        nameInfo.frame.origin.y = 436
        numberInfo.frame.origin.x = 60
        numberInfo.frame.origin.y = 477
        enter.frame.origin.x = 170
        enter.frame.origin.y = 513
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numberInfo.resignFirstResponder()
    }
    @IBAction func openTestWebsite(_ sender: Any) {
    UIApplication.shared.open(URL(string:"https://suicidepreventionlifeline.org/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func openADAAsite(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://adaa.org/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func openAOFHsite(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://allianceofhope.org/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func callNASH(_ sender: Any) {
        UIApplication.shared.open(URL(string:"tel://18006214000")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func callNSPH(_ sender: Any) {
        UIApplication.shared.open(URL(string:"tel://18002738255")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func callSCC(_ sender: Any) {
        UIApplication.shared.open(URL(string:"tel://18009999999")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func callANYC(_ sender: Any) {
        UIApplication.shared.open(URL(string:"tel://18002334357")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func callContact(_ sender: Any) {
        do {
            let contacts = try self.database.prepare(self.contactTable)
            for contact in contacts {
                if contact[self.id] == 1 {
                UIApplication.shared.open(URL(string:"tel://\(contact[self.number])")! as URL, options: [:], completionHandler: nil)
                }
            }
        } catch {
            print(error)
        }
    }
    
    @objc func dismissKeyboard() {
        nameInfo.resignFirstResponder()
    }
    @objc func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
