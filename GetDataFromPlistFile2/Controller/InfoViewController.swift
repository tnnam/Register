//
//  InfoViewController.swift
//  GetDataFromPlistFile2
//
//  Created by Tran Ngoc Nam on 5/4/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var district: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        city.text = UserDefaults.standard.string(forKey: "cityName")
        district.text = UserDefaults.standard.string(forKey: "districtName")
        age.text = UserDefaults.standard.string(forKey: "chooseAge")
        gender.text = UserDefaults.standard.string(forKey: "gender")
    }

}
