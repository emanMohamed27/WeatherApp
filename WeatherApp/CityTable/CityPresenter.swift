//
//  CityPresenter.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/31/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit
import CoreData

protocol CityPresenterProtocol{
    
     func loadCities()
     func deleteNotesPress(index : Int)
    
    
}

class CityPresenter : CityPresenterProtocol{
    
    
    var listOfCities = [Location]()
    
    func loadCities()
    {
        let fetchRequest : NSFetchRequest<Location> = Location.fetchRequest()
        
        do{
            listOfCities  = try context.fetch(fetchRequest)
            print("data from DB \(listOfCities.count)")
          
        }catch{
            print("don't find data")
        }
        
    }
    
    
    
    func deleteNotesPress(index : Int)
    {
        print("befor\( listOfCities.count)")
        do{
            context.delete(listOfCities[index])
            listOfCities.remove(at: index)
            try context.save()
            loadCities()
            //print("deleted")
        }
        catch let error as NSError  {
            print("Could not delete \(error), \(error.userInfo)")
        }
        
    }
    
 
    

}
