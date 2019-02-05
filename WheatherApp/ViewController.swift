//
//  ViewController.swift
//  WheatherApp
//
//  Created by Bletty Jans on 04/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let url = URL(string: "http://www.google.com")
        {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url)
            { (data, response, error) -> Void in
                
                // Do something with the data
            }
            
            task.resume()
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

