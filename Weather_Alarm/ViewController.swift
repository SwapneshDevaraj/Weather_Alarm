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
    
    var schedular = Timer()
    var circle = BaseCircle()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
        self.view.addSubview(circle)
        
        
        
        circle.start()
        
    }
    
    
    
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        //
        //        circle.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        //        circle.layer.cornerRadius = (circle.frame.width)/2
        //        circle.center = CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
        
        if UIDevice.current.orientation.isLandscape
        {
            print("Landscape")
            circle.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.height, height: self.view.frame.size.height)
            circle.layer.cornerRadius = (circle.frame.height)/2
            circle.center = CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
            
            
        } else
        {
            print("Portrait")
            circle.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
            circle.layer.cornerRadius = (circle.frame.width)/2
            circle.center = CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
            
        }
        
        
    }
    
}

