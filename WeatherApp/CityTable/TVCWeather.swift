//
//  TVCWeather.swift
//  WeatherApp
//
//  Created by Eman Elsayed on 1/30/19.
//  Copyright © 2019 EmanKamal. All rights reserved.
//

import UIKit

class TVCWeather: UITableViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCity(location : Location)
    {
        cityName.text = location.city
        countryName.text = location.country
        cityImage.image = UIImage(named: "weatherIcon")
     
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
