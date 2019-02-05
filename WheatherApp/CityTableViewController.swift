//
//  CityTableViewController.swift
//  WheatherApp
//
//  Created by Bletty Jans on 05/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation
import  UIKit

class
CityTableViewController: UITableViewController {
    
    var  cities: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cities = ["Torronto","Hawai","Sydeny","Vancouver","Delhi"]
        
        self.tableView .reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView .dequeueReusableCell(withIdentifier: "cityCell") as! CityTableViewCell
        
        cell.setCity(city: cities[indexPath.row])
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let forecastTableView = segue.destination as! ForecastTableViewController
        let cityIndexPath = self.tableView.indexPath(for: (sender as! UITableViewCell))!
        
        forecastTableView.setCity(city: cities[cityIndexPath.row])
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
}

