//
//  DetailViewController.swift
//  GreatApp
//
//  Created by iSal on 14/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
    }
    
    @IBAction func onDone(_ sender: Any) {
        let fullName = self.fullName.text
        UserDefaults.standard.set(fullName, forKey: "name")
        name = fullName!
        
        navigationController?.popViewController(animated: true)
    }
    
    private func updateUI(){
        self.fullName.text = name
        
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
