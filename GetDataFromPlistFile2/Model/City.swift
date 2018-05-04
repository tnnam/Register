//
//  City.swift
//  GetDataFromPlistFile2
//
//  Created by Tran Ngoc Nam on 4/30/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class City {
    var cityCode: Int?
    var name: String?
    
    init?(dict: DICT) {
        guard let cityCode = dict["CityCode"] as? Int else { return nil }
        guard let name = dict["Name"] as? String else { return nil }
        self.cityCode = cityCode
        self.name = name
    }
}
