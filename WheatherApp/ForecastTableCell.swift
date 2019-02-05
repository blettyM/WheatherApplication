//
//  ForecastTableCell.swift
//  WheatherApp
//
//  Created by Bletty Jans on 05/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation
import UIKit

class ForecastTableCell: UITableViewCell{

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    func setForecast(forecast: ForecastData)
    {
    self.dateLabel.text = forecast.dateString
    
    self.tempLabel.text = forecast.dayTemparature
    self.highTempLabel.text = forecast.maxTemperature
    self.lowTempLabel.text = forecast.minTemperature
    
    self.loadImage(iconCode: forecast.iconcode)
    
    }
    
    func loadImage(iconCode: String)
    {
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
