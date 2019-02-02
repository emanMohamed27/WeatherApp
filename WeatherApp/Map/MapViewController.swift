//
//  ViewController.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/30/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapPresenter = MapPresnter()
    
    @IBOutlet weak var mapView : MKMapView!
    // @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  navigationItem.title = "Choose City"
      //navigationItem.leftBarButtonItem.
        
        let longPressGesturePress = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        longPressGesturePress.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPressGesturePress)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // add annotation or pin on map
    @objc func addAnnotation(press : UILongPressGestureRecognizer){
        if press.state == .began
        {
            let location = press.location(in: mapView)
            let cordinates = self.mapView.convert(location, toCoordinateFrom: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate=cordinates
            
            annotation.title = "Selected"
            annotation.subtitle = "place is selected"
            
           //print(annotation.coordinate.latitude)
           mapPresenter.getLocation(Latitude: annotation.coordinate.latitude, Longitude: annotation.coordinate.longitude)
            
            mapView.addAnnotation(annotation)
        }
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    

}

