//
//  ForecastData.swift
//  WheatherApp
//
//  Created by Bletty Jans on 05/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation
import UIKit

class ForecastData

{

    var dateString: String
    var cityName: String
    
    
    var dayTemparature: String
    var minTemperature: String
    var maxTemperature: String
    
    var iconcode: String


    init(city: String, data: JSON) {
        
        
        self.cityName = city
        
        self.dayTemparature = "\(data["temp"]["day"].intValue)°"
        self.minTemperature = "\(data["temp"]["min"].intValue)°"
        self.maxTemperature = "\(data["temp"]["max"].intValue)°"
        
        self.iconcode = data["weather"].arrayValue[0]["icon"].stringValue
        
        let date = Date (timeIntervalSince1970: data["dt"].doubleValue)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM, dd"
        self.dateString = formatter.string(from: date)
        
    }


}
