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

