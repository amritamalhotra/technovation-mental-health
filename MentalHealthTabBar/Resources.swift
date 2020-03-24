//
//  SecondViewController.swift
//  MentalHealthTabBar
//
//  Created by Amrita Malhotra on 1/5/20.
//  Copyright © 2020 Amrita Malhotra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameInfo: UITextField!
    @IBOutlet weak var numberInfo: UITextField!
    @IBOutlet weak var contactDisplay: UITextView!
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
        
        let name = nameInfo.text!
        let number = numberInfo.text!
        contactDisplay.text = "current contact info: \nName: \(name)\nNumber: \(number)"

    }
    @IBAction func enter(_ sender: Any) {
        contactDisplay.text = "current contact info:\nName: \(nameInfo.text!)\nNumber: \(numberInfo.text!)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numberInfo.resignFirstResponder()
    }
    @IBAction func makeTestCall(_ sender: Any) {
        UIApplication.shared.open(URL(string:"tel://5107342459")! as URL, options: [:], completionHandler: nil)
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
        UIApplication.shared.open(URL(string:"tel://\(numberInfo.text!)")! as URL, options: [:], completionHandler: nil)
    }
    
}
