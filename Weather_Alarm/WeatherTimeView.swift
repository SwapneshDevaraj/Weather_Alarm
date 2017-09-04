//
//  WeatherTimeView.swift
//  Weather_Alarm
//
//  Created by IOS1 on 01/09/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherTimeView: UIView,CLLocationManagerDelegate

{
    private var lat : Double = 0.0
    private var lon : Double = 0.0
    
    
    
    let locationManager = CLLocationManager()

    
    
    let baseCircle = BaseCircle()
    var weatherImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        getLocation()
        Timer.scheduledTimer(timeInterval: 1800, target: self, selector: #selector(self.getLocation), userInfo: nil, repeats: true)

    
        weatherImage.contentMode =  UIViewContentMode.scaleAspectFit
        weatherImage.layer.borderWidth = 0
        weatherImage.layer.borderColor = UIColor.clear.cgColor
        
//        if ([UIImage, imageNamed: someString])
//        {
//            //the image exists..
//        }
//        else
//        {
//            //no image with that name
//        }
//         (UIImage(named: "green-square-Retina") != nil
//       )
        
        
        self.addSubview(baseCircle)
        self.addSubview(weatherImage)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        
            baseCircle.frame = CGRect(x: 0, y: 0, width: self.frame.size.width*0.8, height: self.frame.size.width*0.8)
            baseCircle.layer.cornerRadius = (baseCircle.frame.width)/2
            baseCircle.center = self.center
        
            weatherImage.frame = CGRect(x: 0 , y: 0, width: baseCircle.frame.size.width*0.5, height: baseCircle.frame.size.height*0.5)
            weatherImage.center = CGPoint(x: baseCircle.frame.midX, y: baseCircle.frame.midY*0.5)
    }
    
    
    func getWeather()
    {
        var temp = ""
        var maxTemp = ""
        var minTemp = ""
        var location = ""
        
        let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather?"
        
        let openWeatherMapAPIKey = "b2076932cbcb994e2d670d8119931746"
        
        let urlString = URL(string: "\(openWeatherMapBaseURL)lat=\(lat)&lon=\(lon)&APPID=\(openWeatherMapAPIKey)&units=metric")
        if let url = urlString
        {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil
                {
                    print("ERROR")
                    print("error")
                } else
                {
                    if data != nil
                    {
                        //print(usableData) //JSONSerialization
                        do
                        {
                            let weatherJson = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                            let weathericon = weatherJson["weather"] as! [[String:Any]]
                            print(weatherJson)
                            let currentConditions = weatherJson["main"] as! [String:Any]
                            print(weathericon.first?["icon"]! ?? "nil")
                            DispatchQueue.main.sync
                                {
                                    temp = String(format:"%.1f", currentConditions["temp"] as! Double) + "º"
                                    minTemp = String(format:"%.1f", currentConditions["temp_min"] as! Double) + "º"
                                    maxTemp = String(format:"%.1f", currentConditions["temp_max"] as! Double) + "º"
                                    location = (weatherJson["name"] as! String)
                                    
                                    self.baseCircle.setWeatherText(temp: temp, maxTemp: maxTemp, minTemp: minTemp, location: location)
                                    
                                    
                            }
                        }
                        catch
                        {
                            
                        }
                    }
                }
            }
            task.resume()
            
            
            
        }
        
        
    }
    
    func getLocation()
    {
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
        }
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let locValue = manager.location!.coordinate
        lat = locValue.latitude
        lon = locValue.longitude
        
        if locations.count > 0
        {
            locationManager.stopUpdatingLocation()
        }
        
        self.getWeather()    //mashape
        
        
    }



}