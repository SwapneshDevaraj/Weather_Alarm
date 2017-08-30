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
    
//    var schedular = Timer()
//    var circle = BaseCircle()
    var cp = CirclePath()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
//        
//        self.view.addSubview(circle)
//        circle.start()
        
        self.view = cp
        cp.clipsToBounds = true
        cp.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Image"))
      
        cp.powerButton.setButton.addTarget(self, action: #selector(setAlarm), for: UIControlEvents.touchUpInside)
    
    }
    
   
    func printAlert(msg: String)
    {
        
        let alert = UIAlertController(title: "Alarm Set", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

    override func viewWillAppear(_ animated: Bool) {
        printAlert(msg: cp.alertMsg)
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
//        if UIDevice.current.orientation.isLandscape
//        {
//            print("Landscape")
//            circle.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.height, height: self.view.frame.size.height)
//            circle.layer.cornerRadius = (circle.frame.height)/2
//            circle.center = CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
//            
//            
//        } else
//        {
//            print("Portrait")
//            circle.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
//            circle.layer.cornerRadius = (circle.frame.width)/2
//            circle.center = CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
//            
//        }
        
        
    }
    
    func setAlarm()
    {
        let days = cp.days
        let buttonArr = [days.sunButton, days.monButton, days.tueButton, days.wedButton, days.thurButton, days.friButton, days.satButton]
        
        
        let hour = (PowerButton.timeLabel.text ?? "00")
        let min = (PowerButton.time2Label.text ?? "00")
        
        var time = ""
        if cp.powerButton.ampmButton.isOn
        {
            time = "AM"
        }
        else{
            time = "PM"
        }
        
        
        var alarmMsg = "\(hour) \(min) \(time) \n"
        
        for btn in buttonArr {
            if btn.btnSelected {
                if let sel = btn.titleLabel?.text
                {
                    alarmMsg += "\(sel) "
                }
            }
            else{
                
            }
            
        }
        
        
        print(alarmMsg)
        
        printAlert(msg: alarmMsg)
        alarmMsg = ""
        
    }

    
    
    
}

