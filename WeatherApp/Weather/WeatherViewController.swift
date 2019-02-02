//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/31/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dateWeather: UILabel!
    @IBOutlet weak var tempWeather: UILabel!
    
    @IBOutlet weak var minMaxTemp: UILabel!
    @IBOutlet weak var statueWeather: UILabel!
    @IBOutlet weak var humidityWeather: UILabel!
    @IBOutlet weak var windDegree: UILabel!
    
    var locModel : LocationModel?
    var currentWeather : Weather!
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let leftButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(buBack))
        // self.navigationItem.leftBarButtonItem = leftButton
        returnWeatherInfo()
        
    }
    
    /// function to fetch weather info from API
    func returnWeatherInfo(){
        WeatherPresenter.fetchWeatherData( Longitude : self.longitude, orLatitude : self.latitude){ (error, result) in
            if(error == nil){
                self.currentWeather = result as! Weather
                self.updateCurrentWeather(self.currentWeather)
            }
        }
        print("inside fetchweather")
    }
    
    /// function to update the Weather details UI with data from API
    
    func updateCurrentWeather(_ weather: Weather) {
       
        self.tempWeather.text = "\(weather.temperature!)º"
        self.minMaxTemp.text = "\(weather.minTemp!)º/\(weather.maxTemp!)"
        self.dateWeather.text = weather.date
        self.humidityWeather.text = "\(weather.humidity!)"
        self.windDegree.text = "\(weather.windDegree!)"
        self.weatherImage.image = weather.weatherImage
        self.statueWeather.text = "\(weather.weatherStatus!)"
        
       
    }
    
    @objc func buBack(_ sender: Any) {
        
        //dismiss(animated: true, completion: nil)
        //    let secondviewController : UIViewController =  (self.storyboard?.instantiateViewController(withIdentifier: "mapView") as? MapViewController)!
        //
        // self.navigationController?.pushViewController(MapViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
