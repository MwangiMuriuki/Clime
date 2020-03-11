//
//  CityViewController.swift
//  Clime
//
//  Created by ERNEST MURIUKI on 3/5/20.
//  Copyright © 2020 ERNEST MURIUKI. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    
    func userEnteredNewCity (city : String)
}

class CityViewController: UIViewController {
    
    var delegate : ChangeCityDelegate?

    @IBOutlet weak var enterCityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func getWeatherBtn(_ sender: Any) {
        
        let cityName = enterCityField.text!
        
        delegate?.userEnteredNewCity(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
