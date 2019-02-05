//
//  ForecastTableViewController.swift
//  WheatherApp
//
//  Created by Bletty Jans on 05/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation
import UIKit

class ForecastTableViewController: UITableViewController

{

    var cityName: String!
    var forecasts: Array<ForecastData>!
    
    func setCity(city: String)
    {
    self.cityName = city
    self.title = city
    
    if let forecastURL = WeatherURLManager.getForecastWeatherURL(city: city)
    {
    let session = URLSession.shared
    
    let task = session.dataTask(with: forecastURL)
    { (data, response, error) -> Void in
    
				if data != nil
				{
    let forecastData = JSON(data: data!)
    self.loadForecasts(data: forecastData)
				}
    }
    
    task.resume()
    }
    }
    
    func loadForecasts(data: JSON)
    {
    self.forecasts = Array<ForecastData>()
    
    let forecastList = data["list"].array!
    
    for json in forecastList
    {	self.forecasts.append(ForecastData(city: self.cityName, data: json))
    }
    
    DispatchQueue.main.async
    {	self.tableView.reloadData()
    }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return self.forecasts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastTableCell
    cell.setForecast(forecast: self.forecasts[indexPath.row])
        
     
    
    return cell
    }
}
