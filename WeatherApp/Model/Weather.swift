//
//  Weather.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/30/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit

class Weather: NSObject {
    
    var temperature: Float?
    var minTemp: Float?
    var maxTemp: Float?
    var weatherStatus: String?
    var windDegree: Float?
    var humidity:Float?
    var weatherMain : String?
    
    
    /// Date of today's weather
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        return "\(currentDate)"
    }
    
    /// Image that represents weather status
    var weatherImage : UIImage {
        
        switch weatherMain {
            
        case "Clouds":
            
            return UIImage(named:"cloud")!
            
        case "Clear":
            
            return UIImage(named:"sun")!
            
        case "Rain":
            
            return UIImage(named:"rain")!
            
        default:
            
            return UIImage(named:"default")!
            
        }
    }
    
    
    
    
    
    init(temperature : Float , minTemp: Float , maxTemp : Float , weatherStatus : String , windDegree : Float , humidity : Float, weatherMain: String , weatherDate: String)
    {
        self.temperature = temperature
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.weatherStatus = weatherStatus
        self.weatherMain = weatherMain
        self.humidity = humidity
        self.windDegree = windDegree
        
        
        
        
        
    }
    
    

}
