//
//  Weather.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit
import CoreLocation

class Weather: UIView,CLLocationManagerDelegate
{
    
    var temp = UILabel()
    var minTemp = UILabel()
    var maxTemp = UILabel()
    var location = UILabel()
    
    private var lat : Double = 0.0
    private var lon : Double = 0.0
    
    let locationManager = CLLocationManager()
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.fadedBlack
        
        self.getLocation()
        
        //temp
        
        temp.textColor = UIColor.myGrey
        
        temp.numberOfLines = 1;
        temp.adjustsFontSizeToFitWidth = true;
        temp.backgroundColor = UIColor.fadedBlack
        temp.font = UIFont.boldSystemFont(ofSize: temp.font.pointSize)
        
        
        
        self.addSubview(temp)
        
        //maxTemp
        
        maxTemp.textColor = .red
        maxTemp.numberOfLines = 1
        maxTemp.adjustsFontSizeToFitWidth = true
        maxTemp.backgroundColor = UIColor.fadedBlack
        
        
        
        self.addSubview(maxTemp)
        
        //minTemp
        
        let myBlue = "#3BB0E3"
        minTemp.textColor = UIColor.hexStringToUIColor(hex: myBlue)
        minTemp.numberOfLines = 1
        minTemp.adjustsFontSizeToFitWidth = true
        minTemp.backgroundColor = UIColor.fadedBlack
        
        self.addSubview(minTemp)
        
        //location
        
        location.textColor = UIColor.myGrey
        location.numberOfLines = 1
        location.adjustsFontSizeToFitWidth = true
        location.backgroundColor = UIColor.fadedBlack
        location.textAlignment = .center
        
        
        self.addSubview(location)
        
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        temp.frame = CGRect(x: (self.frame.size.width*0.5)-((self.frame.size.width*0.35)*0.5), y: 0, width: self.frame.size.width*0.35, height:(self.frame.size.height*0.50) )
        
        maxTemp.frame = CGRect(x: 0, y: temp.frame.origin.y+(self.frame.size.height*0.65)*0.1, width: (self.frame.size.width*0.35)*0.75, height:(self.frame.size.height*0.65)*0.75 )
        
        minTemp.frame = CGRect(x: self.frame.size.width-(self.frame.size.width*0.35)*0.75, y: temp.frame.origin.y+(self.frame.size.height*0.65)*0.1, width: (self.frame.size.width*0.35)*0.75, height:(self.frame.size.height*0.65)*0.75 )
        
        location.frame = CGRect(x: 0, y: minTemp.frame.origin.y+minTemp.frame.size.height, width: self.frame.size.width, height:self.frame.size.height*0.30 )
        
        
        
    }
    
    
    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        
        temp.font = UIFont.systemFont(ofSize: temp.frame.size.height)
        temp.font = UIFont.boldSystemFont(ofSize: temp.font.pointSize)
        
        minTemp.font = UIFont.systemFont(ofSize: minTemp.frame.size.height)
        minTemp.font = UIFont.boldSystemFont(ofSize: minTemp.font.pointSize)
        
        maxTemp.font = UIFont.systemFont(ofSize: maxTemp.frame.size.height)
        maxTemp.font = UIFont.boldSystemFont(ofSize: maxTemp.font.pointSize)
        
        location.font = UIFont.systemFont(ofSize: location.frame.size.height)
        location.font = UIFont.boldSystemFont(ofSize: location.font.pointSize)
        
    }
    
    
    
    
    
    
    func getWeather()
    {
        let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather?"
        
        let openWeatherMapAPIKey = "b2076932cbcb994e2d670d8119931746"
        
        print("\(openWeatherMapBaseURL)lat=\(lat)&lon=\(lon)&APPID=\(openWeatherMapAPIKey)")
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
                    if let usableData = data
                    {
                        print(usableData) //JSONSerialization
                        do
                        {
                            let weatherJson = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                            
                            let currentConditions = weatherJson["main"] as! [String:Any]
                            print(currentConditions)
                            DispatchQueue.main.sync
                                {
                                    self.temp.text = String(format:"%.1f", currentConditions["temp"] as! Double) + "º"
                                    self.minTemp.text = String(format:"%.1f", currentConditions["temp_min"] as! Double) + "º"
                                    self.maxTemp.text = String(format:"%.1f", currentConditions["temp_max"] as! Double) + "º"
                                    self.location.text = (weatherJson["name"] as! String)
                                    self.addShadowtoLabels()
                            }
                            
                            print("updated weather lables")
                            print("temp =\(self.temp.text ?? "...")")
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
    
    func addShadowtoLabels()
    {
        temp.attributedText = NSShadow.getShadow(temp.text!,2,(temp.frame.size.height+temp.frame.size.height*0.5)*0.1)
        minTemp.attributedText = NSShadow.getShadow(minTemp.text!,2,(minTemp.frame.size.height+minTemp.frame.size.height*0.5)*0.1)
        maxTemp.attributedText = NSShadow.getShadow(maxTemp.text!,2,(maxTemp.frame.size.height+maxTemp.frame.size.height*0.5)*0.1)
        location.attributedText = NSShadow.getShadow(location.text!,2,(location.frame.size.height+location.frame.size.height*0.5)*0.1)
    }
    
    func getLocation()
    {
        print("in loc")
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
