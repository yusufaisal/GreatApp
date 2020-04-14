//
//  NotificationDetailViewController.swift
//  GreatApp
//
//  Created by iSal on 15/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit

class NotificationDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    var data:NotificationSchema?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        guard let data = self.data else { return  }
        self.imageView.image = UIImage(systemName: data.icon)
        self.titleLabel.text = data.title
        self.messageLabel.text = data.message
    }
}
