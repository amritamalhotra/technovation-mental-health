//
//  Tips.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import SQLite

class Tips: UIViewController {

    @IBOutlet weak var result: UITextView!
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var getTipsButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var viewButton: UIButton!
    
    var database: Connection!
    let tipsTable = Table("tips")
    let id = Expression<Int>("id")
    let tip = Expression<String>("tip")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTipsButton.layer.cornerRadius = 10
        getTipsButton.layer.borderWidth = 0.5
        addButton.layer.cornerRadius = 10
        addButton.layer.borderWidth = 0.5
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.borderWidth = 0.5
        editButton.layer.cornerRadius = 10
        editButton.layer.borderWidth = 0.5
        viewButton.layer.cornerRadius = 10
        viewButton.layer.borderWidth = 0.5
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("tips").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
        
        let createTable = self.tipsTable.create { (table) in
                   table.column(self.id, primaryKey: true)
                   table.column(self.tip)
               }
               do {
                   try self.database.run(createTable)
               } catch {
                   print(error)
               }
    
        emotionLabel.text = Emotions.shared.theEmotion
        tipText.text = Emotions.shared.theTip

    }
    @IBAction func toReminders(sender: UIButton) {
        performSegue(withIdentifier: "NewController", sender: self)
    }
    
    @IBAction func addNewTip(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Tip", message: "Type your personal tip below", preferredStyle: .alert)
        alert.addTextField{(tf) in tf.placeholder = "Tip" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let tipContent = alert.textFields?.first?.text
                else {return}
            let insertTip = self.tipsTable.insert(self.tip <- tipContent)
            self.result.text = "New Tip: \(tipContent)"
            do {
                try self.database.run(insertTip)
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func deleteTip(_ sender: Any) {
        let alert2 = UIAlertController(title: "Delete Tip", message: "Choose which tip to delete", preferredStyle: .alert)
        alert2.addTextField{(tf) in tf.placeholder = "Tip Number" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let tipIdString = alert2.textFields?.first?.text,
                let tipId = Int(tipIdString)
                else {return}
            self.result.text = "Deleted tip \(tipIdString)"
            let tip = self.tipsTable.filter(self.id == tipId)
            let deleteTip = tip.delete()
            do {
                try self.database.run(deleteTip)
            } catch {
                print(error)
            }
        }
        alert2.addAction(action)
        present(alert2, animated: true, completion: nil)
    }
    @IBAction func editTip(_ sender: Any) {
        let alert3 = UIAlertController(title: "Edit Tip", message: "Choose which tip to edit and type in new tip.", preferredStyle: .alert)
        alert3.addTextField{(tf) in tf.placeholder = "Tip Number" }
        alert3.addTextField{(tf) in tf.placeholder = "Tip" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let tipIdString = alert3.textFields?.first?.text,
                let tipId = Int(tipIdString),
                let tipContent = alert3.textFields?.last?.text
                else {return}
            self.result.text = "Edited Tip number \(tipIdString)\n\(tipContent)"
            
            let tipper = self.tipsTable.filter(self.id == tipId)
            let editTip = tipper.update(self.tip <- tipContent)
            do {
                try self.database.run(editTip)
            } catch {
                print(error)
            }
            
        }
        alert3.addAction(action)
        present(alert3, animated: true, completion: nil)
    }
    @IBAction func viewAllTips(_ sender: Any) {
        result.text = ""
        do {
            let tips = try self.database.prepare(self.tipsTable)
            for tip in tips {
                result.text += "\nnumber: \(tip[self.id])\n personal tip: \(tip[self.tip])\n"
            }
        } catch {
            print(error)
        }
    }
   
    @IBAction func getPersonalTips(_ sender: Any) {
        emotionLabel.text = Emotions.shared.theEmotion
        tipText.text = Emotions.shared.theTip
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
}
extension UIViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
