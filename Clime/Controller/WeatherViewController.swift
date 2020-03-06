//
//  ViewController.swift
//  Clime
//
//  Created by ERNEST MURIUKI on 3/4/20.
//  Copyright © 2020 ERNEST MURIUKI. All rights reserved.
//

import UIKit

import CoreLocation 

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "2964dd9736735dcd4fe5082df910b5a1"
    
    let locationManager = CLLocationManager ()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    //MARK: - Networking
    /***************************************************************************/
    //Write the getWeatherData Method here
    
    
    //MARK: - JSON Parsing
       /***************************************************************************/
       //Write the updateWeatherData Method here
    
    
    //MARK: - UI Updates
       /***************************************************************************/
       //Write the updateUIWithWeatherData Method here
    
    
    
    
    //MARK: - Location Manager Delegate Methods
       /***************************************************************************/
       //Write the didUpdateLocations Method here
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        let loc = locations[locations.count - 1]
        if (loc.horizontalAccuracy > 0){
        
            locationManager.stopUpdatingLocation()
            let latitude = loc.coordinate.latitude
            let longitude = loc.coordinate.longitude
            
//            let params : [String : String] = ["lat" : latitude, "long" : longitude, "appid" : APP_ID]
            print("location = \(longitude), \(latitude)")
        }
       
        
    }
    
       //Write the didFailWithError Method here
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Error"
        
    }
    
    
    
    
    //MARK: - Change City Delegate Methods
        /***************************************************************************/
        //Write the userEnteredANewCityName Method here
    
    //Write the PrepareForSegue
    


}

