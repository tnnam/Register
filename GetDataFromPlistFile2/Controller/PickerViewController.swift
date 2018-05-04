//
//  ViewController.swift
//  GetDataFromPlistFile2
//
//  Created by Tran Ngoc Nam on 4/29/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var chooseButton: UIButton!
    var arrAge = [Int](0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = UserDefaults.standard.string(forKey: "districtName")
        chooseButton.layer.cornerRadius = chooseButton.frame.size.width/2
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(17, inComponent: 0, animated: true)
       
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrAge.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: arrAge[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(arrAge[row], forKey: "chooseAge")
    }
    
}

