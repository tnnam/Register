//
//  DataServices.swift
//  GetDataFromPlistFile2
//
//  Created by Tran Ngoc Nam on 4/30/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

typealias DICT = Dictionary<AnyHashable, Any>

class DataServices {
    
    static let shared = DataServices()
    
    // MARK: Cities
    private var _cities: [City]?
    
    var cityCode: Int?
    
    var cities: [City] {
        get {
            if _cities == nil {
                 _cities = []
                getDataCities()
            }
            return _cities ?? []
        }
    }
    
    // MARK: Districts
    private var _districts: [District]?
    
    var districts: [District] {
        get {
            if _districts == nil {
                _districts = []
                getDataDistricts()
            }
            return cityCode == nil ? [] : (_districts ?? []).filter { $0.cityCode == cityCode }
        }
    }
    
    func getDataCities() {
        guard let path = Bundle.main.path(forResource: "Cities", ofType: "plist") else { return }
        guard let data = FileManager.default.contents(atPath: path) else { return }
        guard let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) else { return }
        guard let dict = result as? DICT else { return }
        guard let cities = dict["Cities"] as? [DICT] else { return }
        for city in cities {
            if let cityObj = City(dict: city) {
                _cities?.append(cityObj)
            }
        }
    }
    
    func getDataDistricts() {
        guard let path = Bundle.main.path(forResource: "Districts", ofType: "plist") else { return }
        guard let data = FileManager.default.contents(atPath: path) else { return }
        guard let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) else { return }
        guard let dict = result as? DICT else { return }
        guard let districts = dict["Districts"] as? [DICT] else { return }
        for district in districts {
            if let districtObj = District(dict: district) {
                _districts?.append(districtObj)
            }
        }
    }
}
