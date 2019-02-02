//
//  LocationModel.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/30/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit

class LocationModel{
    
    var country : String = ""
    var city : String = ""
    var latitude : Double
    var longitude : Double
    
    init(city :String, country:String, longitude:Double, latitude:Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.country = country
    }
    

}
