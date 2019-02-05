//
//  CityTableViewCell.swift
//  WheatherApp
//
//  Created by Bletty Jans on 05/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation
import UIKit

class CityTableViewCell: UITableViewCell{

   
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var wheatherLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    func setCity(city: String) {
        
        cityLabel.text = city
        
        if let wheatherUrl = WeatherURLManager.getCityWeatherURL(city: city)
        {
        
            let session = URLSession.shared
            let task = session.dataTask(with: wheatherUrl)
                
            {
                (data, response, error) -> Void in
                
                if data != nil{
                    
                    let weatherData = JSON(data: data!)
                    let tempValue = weatherData["main"]["temp"].intValue
                    
                    DispatchQueue.main.async {
                        
                        self.wheatherLabel.text = "\(tempValue)°"
                    }
                    // Load Icon
                    self.loadIcon(weatherData: weatherData)
                    
                }}
            
            task.resume()
        
        }
        
    }

    func loadIcon(weatherData: JSON)
    {
        let weatherArray = weatherData["weather"].arrayValue
        let iconCode = weatherArray[0]["icon"].stringValue
        
        if let iconURL = WeatherURLManager.getWeatherIconURL(iconCode: iconCode)
        {
            let session = URLSession.shared
            
            let task = session.dataTask(with: iconURL)
            { (data, response, error) -> Void in
                
                if data != nil
                {
                    DispatchQueue.main.async
                        {	self.iconImageView.image = UIImage(data: data!)
                    }
                }
            }
            
            task.resume()
        }
    }
    
}
