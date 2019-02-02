//
//  MapPresnter.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/30/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


protocol MapPresenterProtocol {
    
     func getLocation(Latitude latitude: Double,Longitude longitude: Double)
     func saveLocation(_ locationModel : LocationModel)
    
    
}




class MapPresnter : MapPresenterProtocol{

    func getLocation(Latitude latitude: Double,Longitude longitude: Double)
    {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler:
            {
                placemarks, error -> Void in
                if error != nil
                {
                    self.createfaildAlert(title: "Error!!", message: error!.localizedDescription)
                }
                else
                {
                // Place details
                guard let placeMark = placemarks?.first else { return }
                    let locationModel = LocationModel(city: placeMark.administrativeArea! ,country: placeMark.country!, longitude: latitude ,latitude: longitude)
                
                   // City
                    if placeMark.administrativeArea != nil{
                      //  print("city : \(city)")
                    }
                
                    // Country
                    if placeMark.country != nil {
                       // print("country\(country)")
                    }
                   // print(locationModel.city)
                   self.saveLocation(locationModel)
                }
        })
        
        
    }

    func saveLocation(_ locationModel : LocationModel)
    {
        let location = Location(context: context)
            location.city = locationModel.city
            location.country = locationModel.country
            location.latitude = locationModel.latitude
            location.longitude = locationModel.longitude
        do{
            ad.saveContext()
            print("Saved .. ")
        }
        catch{
            print("Don't Save in DB")
        }
        
    }
    
//    func createSuccessAlert(title : String ,message : String , saveLocation : ( LocationModel ) -> Void ){
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//        alert.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler:{
//
//            saveLocation(locationModel)
//        } ))
//
//        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {(action) in
//
//            alert.dismiss(animated: true, completion: nil)
//            //////
//
//
//        } ))
//}
//
    
    
    func createfaildAlert(title : String , message : String)
    {
        UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert).addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil ))
    }
    
    

}
