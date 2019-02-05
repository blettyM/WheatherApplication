//
//  CityTableViewController.swift
//  WheatherApp
//
//  Created by Bletty Jans on 05/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation
import UIKit

class CityTableViewController: UITableViewController

{

    var city: Array<String>!
    

    override func viewDidLoad() {
        
        city = ["Hawai","Torronto","Sydney","Vancouver","Delhi"]
        tableView.reloadData()
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return city?.count ?? 0
    }
}

