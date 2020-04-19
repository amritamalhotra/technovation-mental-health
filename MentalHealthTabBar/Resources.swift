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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        nameInfo.alpha = 1
        numberInfo.alpha = 1
        enter.alpha = 1
    }
    @IBAction func editContact(_ sender: Any) {
        nameInfo.alpha = 1
        numberInfo.alpha = 1
        enterEdit.alpha = 1
        enter.alpha = 0
    }
    @IBAction func viewContact(_ sender: Any) {
        do {
        let contacts = try self.database.prepare(self.contactTable)
        for contact in contacts {
            contactDisplay.text = "current contact info: \nName: \(contact[self.name])\nPhone Number: \(contact[self.number])"
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
            contactDisplay.text = "current contact info: \nName: \(contact[self.name])\nPhone Number: \(contact[self.number])"
            }
        } catch {
            print(error)
        }
        nameInfo.alpha = 0
        numberInfo.alpha = 0
        enterEdit.alpha = 0
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
        let contact = self.contactTable.filter(self.id == 1)
        UIApplication.shared.open(URL(string:"tel://\(contact[self.number])")! as URL, options: [:], completionHandler: nil)
    }
}
