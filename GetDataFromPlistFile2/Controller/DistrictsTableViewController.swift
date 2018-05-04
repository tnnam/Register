//
//  DistrictsTableViewController.swift
//  GetDataFromPlistFile2
//
//  Created by Tran Ngoc Nam on 4/30/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class DistrictsTableViewController: UITableViewController {

    var districts = [District]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        districts = DataServices.shared.districts
        
        navigationItem.title = UserDefaults.standard.string(forKey: "cityName")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return districts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = districts[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let district = districts[indexPath.row]
        UserDefaults.standard.set(district.name, forKey: "districtName")
    }
}
