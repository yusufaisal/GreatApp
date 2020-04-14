//
//  ViewController.swift
//  GreatApp
//
//  Created by iSal on 14/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var notificationBox: UIView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(setupUI),
                                     userInfo: nil,
                                     repeats: true)
    }
    @objc func setupUI() {
        let date = Date() // save date, so all components use the same date
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        time.text = "\(hour):\(minute):\(second)"
        greetingLabel.text = setTitle(hour: hour)
        
        notificationBox.layer.cornerRadius = 5
        notificationBox.layer.shadowColor = UIColor.systemPink.cgColor
        notificationBox.layer.shadowOpacity = 0.2
        notificationBox.layer.shadowOffset = .zero
        notificationBox.layer.shadowRadius = 3
    }
    
    private func setTitle(hour: Int) -> String{
        var title:String = ""
        let fullName:String = name
        
        switch hour {
        case 0...9: title = "Good morning, \(fullName)"
        case 10...17: title = "Good afternoon, \(fullName)"
        case 18...23: title = "Good night, \(fullName)"
        default:
            break
        }
        
        return title
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.notificationBox.isHidden = true
    }
}

