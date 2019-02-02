//
//  CityTableViewController.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/30/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit
import CoreData

class CityTableViewController: UITableViewController {
    
    var cityPresenter = CityPresenter()
    //var listOfCities = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cityPresenter.loadCities()
        self.tableView.reloadData()
       
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return cityPresenter.listOfCities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TVCWeather = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! TVCWeather
        cell.setCity(location: cityPresenter.listOfCities [indexPath.row])
        //        let cities = loadCities
        // cell.cityName = listOfCities[indexPath.row].city
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            cityPresenter.deleteNotesPress(index: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let weatherdetailsVC = storyBoard.instantiateViewController(withIdentifier: "weatherReport") as! WeatherViewController
        weatherdetailsVC.latitude = cityPresenter.listOfCities[indexPath.row].latitude
        weatherdetailsVC.longitude = cityPresenter.listOfCities[indexPath.row].longitude
        weatherdetailsVC.title = cityPresenter.listOfCities[indexPath.row].city! + " Weather"
        self.navigationController?.pushViewController(weatherdetailsVC, animated: true)
    }
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
       cityPresenter.loadCities()
        self.tableView.reloadData()
        
    }
    
   
}
