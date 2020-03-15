//
//  Journal.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/8/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit
import SQLite

class Journal: UIViewController {

    @IBOutlet weak var entryDate: UITextView!
    @IBOutlet weak var entryContent: UITextView!
    var journalDatabase: Connection!
    let journalTable = Table("journal")
    let id = Expression<Int>("id")
    let date = Expression<Int>("date")
    let content = Expression<String>("content")
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("journal").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.journalDatabase = database
        } catch {
            print(error)
        }
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func journalToExercises(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createJournal(_ sender: Any) {
        let createJournal = self.journalTable.create {
            (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.date)
            table.column(self.content)
        }
        do {
            try self.journalDatabase.run(createJournal)
            print("Created journal!")
        } catch {
            print(error)
        }
    }
    
    @IBAction func newEntry(_ sender: Any) {
        let alert = UIAlertController(title: "New Entry", message: "Type the date and your entry here", preferredStyle: .alert)
        alert.addTextField{(tf) in tf.placeholder = "Date (MMDDYY)" }
        alert.addTextField{(tf) in tf.placeholder = "Content" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let dateString = alert.textFields?.first?.text,
                let date = Int(dateString),
                let content = alert.textFields?.last?.text
                else {return}
            
            self.entryDate.text = dateString
            self.entryContent.text = content
            
            let insertEntry = self.journalTable.insert(self.date <- date, self.content <- content)
            do {
                try self.journalDatabase.run(insertEntry)
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func viewEntry(_ sender: Any) {
        let alert4 = UIAlertController(title: "View Entry", message: "Enter the date of the entry you wish to read", preferredStyle: .alert)
        alert4.addTextField{(tf) in tf.placeholder = "Date (MMDDYY)" }
        let action = UIAlertAction(title: "Submit", style: .default) {(_) in
            guard let dateString = alert4.textFields?.first?.text,
                let date = Int(dateString)
                else {return}
            do {
                let journals = try self.journalDatabase.prepare(self.journalTable)
                for journal in journals {
                    if journal[self.date] == date {
                        self.entryDate.text = "date: \(journal[self.date])"
                        self.entryContent.text = "content: \(journal[self.content])"
                    }
                }
            } catch {
                print(error)
            }
        }
        
        alert4.addAction(action)
        present(alert4, animated: true, completion: nil)
    }
    
    @IBAction func viewJournal(_ sender: Any) {
        do {
            self.entryContent.text = ""
            let journals = try self.journalDatabase.prepare(self.journalTable)
            for journal in journals {
                    self.entryDate.text = "Viewing Whole Journal"
                    self.entryContent.text
                        += "date: \(journal[self.date]), content: \(journal[self.content])\n"
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func deleteEntry(_ sender: Any) {
        let alert2 = UIAlertController(title: "Delete Entry", message: "Enter the date of the entry you wish to delete", preferredStyle: .alert)
        alert2.addTextField{(tf) in tf.placeholder = "Date (MMDDYY)" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let dateString = alert2.textFields?.first?.text,
                let date = Int(dateString)
                else {return}
            
            let theEntry = self.journalTable.filter(self.date == date)
            let deleteEntry = theEntry.delete()
            do {
                try self.journalDatabase.run(deleteEntry)
            } catch {
                print(error)
            }
            self.entryDate.text = "Entry from \(date) deleted!"
        }
        alert2.addAction(action)
        present(alert2, animated: true, completion: nil)
    }
    
    @IBAction func updateEntry(_ sender: Any) {
        let alert3 = UIAlertController(title: "Edit Entry", message: "Message", preferredStyle: .alert)
        alert3.addTextField{(tf) in tf.placeholder = "Date" }
        alert3.addTextField{(tf) in tf.placeholder = "New Content" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let dateString = alert3.textFields?.first?.text,
                let date = Int(dateString),
                let content = alert3.textFields?.last?.text
                else {return}
            self.entryDate.text = dateString
            self.entryContent.text = content
            
            let theContent = self.journalTable.filter(self.date == date)
            let updateEntry = theContent.update(self.content <- content)
            do {
                try self.journalDatabase.run(updateEntry)
            } catch {
                print(error)
            }
            
        }
        alert3.addAction(action)
        present(alert3, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
