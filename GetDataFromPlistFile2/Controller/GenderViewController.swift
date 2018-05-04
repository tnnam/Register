//
//  GenderViewController.swift
//  GetDataFromPlistFile2
//
//  Created by Tran Ngoc Nam on 5/1/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {
    
    @IBOutlet var checkGender: [UIButton]!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveButton.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectGender(_ sender: UIButton) {
        sender.isSelected = true
        checkGender.forEach(){ button in
           if button != sender {
                button.isSelected = false
                saveButton.isEnabled = true
            }
        }
        UserDefaults.standard.set(sender.currentTitle, forKey: "gender")
    }
    
}
