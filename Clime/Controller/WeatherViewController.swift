//
//  ViewController.swift
//  Clime
//
//  Created by ERNEST MURIUKI on 3/4/20.
//  Copyright © 2020 ERNEST MURIUKI. All rights reserved.
//

import UIKit

import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "2964dd9736735dcd4fe5082df910b5a1"
    
    let locationManager = CLLocationManager ()
    let weatherDataModel = WeatherDataModel()
    
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
    
    func getWeatherData(url: String, parameters: [String: String]){
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON{
            response in
            if response.result.isSuccess{
                 print("Success!!!")
                self.cityLabel.text = "Success"
                
                let weatherJSON : JSON = JSON(response.result.value!)
                
//                print(weatherJSON)
                
                self.updateWeatherData(json: weatherJSON)
                
                
            }else{
                
                print("Error \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Issues"
            }
        }
        
        
    }
    
    
    //MARK: - JSON Parsing
       /***************************************************************************/
       //Write the updateWeatherData Method here
    
    func updateWeatherData(json : JSON){
        
        if let tempResults = json["main"]["temp"].double{
            let cityName = json["name"].stringValue
            weatherDataModel.temperature = Int(tempResults - 273.15)
            weatherDataModel.city = cityName
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            
            updateUIWithWeatherData()
            
        }else{
            
            cityLabel.text = "Unavailable"
            
        }
        
        
    }
    
    
    //MARK: - UI Updates
       /***************************************************************************/
       //Write the updateUIWithWeatherData Method here
    
    func updateUIWithWeatherData(){
        
        cityLabel.text = weatherDataModel.city
        tempLabel.text = String(weatherDataModel.temperature)
        imageIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
       /***************************************************************************/
       //Write the didUpdateLocations Method here
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        let loc = locations[locations.count - 1]
        if (loc.horizontalAccuracy > 0){
        
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            let latitude = String(loc.coordinate.latitude)
            let longitude = String(loc.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            print("location = \(longitude), \(latitude)")
//            print("location = \(params["long"]), \(params["lat"])")
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
       
        
    }
    
       //Write the didFailWithError Method here
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Error Fetching Location."
        
    }
    
    
    
    
    //MARK: - Change City Delegate Methods
        /***************************************************************************/
        //Write the userEnteredANewCityName Method here
    
    //Write the PrepareForSegue
    


}

