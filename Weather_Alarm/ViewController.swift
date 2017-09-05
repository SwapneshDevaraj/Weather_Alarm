
//
//  ViewController.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
 
    private var showingBack = false
    
    private var setAlarmView = true
    
    var weatherView = WeatherTimeView()
    var alaramView = CirclePath()
    let returnButton = UIButton()
    
    let mainView = UIView()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bImage"))
        mainView.backgroundColor = .clear
        
        mainView.addSubview(weatherView)
        returnButton.setImage(#imageLiteral(resourceName: "alarm"), for: .normal)
        returnButton.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15)
        returnButton.addTarget(self, action: #selector(tap), for: UIControlEvents.touchUpInside)
        returnButton.backgroundColor = UIColor.fadedBlack
        self.view.addSubview(mainView)
        self.view.addSubview(returnButton)
        
        weatherView.baseCircle.start()
    }
    
    func tap () {
        if showingBack{
            
            UIView.transition(from: alaramView, to: weatherView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            
            alaramView.isHidden = true
            weatherView.isHidden = false
            
            showingBack = false
            
            weatherView.baseCircle.start()
            
            returnButton.setImage(#imageLiteral(resourceName: "alarm"), for: .normal)
        }
        else {
            
            weatherView.baseCircle.invalidateTimer();
            
            if(setAlarmView)
            {
                mainView.addSubview(alaramView)
                setAlarmView = false
            }
            
            showingBack = true
            
            UIView.transition(from: self.weatherView, to: self.alaramView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            
            alaramView.isHidden = false
            weatherView.isHidden = true
            returnButton.setImage(#imageLiteral(resourceName: "backArrow"), for: .normal)
            
        }
    }
    
    
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        mainView.frame = self.view.frame
        
        returnButton.bounds = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width*0.15, height: self.view.frame.size.width*0.15)
        returnButton.center = CGPoint(x: self.view.frame.size.width*0.15, y: self.view.frame.size.height*0.72)
        returnButton.layer.cornerRadius = returnButton.frame.size.width*0.5

        alaramView.frame = self.view.frame
        weatherView.frame = self.view.frame
            
        self.view.bringSubview(toFront: returnButton)
        
        
    }
    
}

