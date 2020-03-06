//
//  ViewController.swift
//  Clime
//
//  Created by ERNEST MURIUKI on 3/4/20.
//  Copyright © 2020 ERNEST MURIUKI. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let temp : String = "34°"
        
        tempLabel.text = temp
    }


}

