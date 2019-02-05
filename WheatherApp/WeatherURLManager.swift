//
//  WeatherURLManager.swift
//  Weather Application
//
//  Copyright © 2016 rutherford. All rights reserved.
//

import Foundation

class WeatherURLManager
{
	class func getCityWeatherURL(city: String) -> URL?
	{
		let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&APPID=acebdb4548ced12a28df4ccf585c3466"

		return URL(string: urlString)
	}

	class func getWeatherIconURL(iconCode: String) -> URL?
	{
		let urlString = "http://openweathermap.org/img/w/\(iconCode).png"

		return URL(string: urlString)
	}

	class func getForecastWeatherURL(city: String) -> URL?
	{
		var urlString = "http://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)"
		urlString = urlString + "&mode=json&units=metric&cnt=7&APPID=acebdb4548ced12a28df4ccf585c3466"

		return URL(string: urlString)
	}
}
