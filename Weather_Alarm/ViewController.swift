//
//  ViewController.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController
{

    var cp = CirclePath()
    let defaults:UserDefaults = UserDefaults.standard
    var count = 0
    
    
    var dateInfo = DateComponents()
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        
        self.view = cp
        cp.clipsToBounds = true
        cp.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Image"))
      
        cp.powerButton.setButton.addTarget(self, action: #selector(setAlarm), for: UIControlEvents.touchUpInside)
        
        print("intial \(count)")
        
    
    }
    
    
   
    func printAlert(msg: String)
    {
        
        let alert = UIAlertController(title: "Alarm Set", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
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
        
        
        //print(alarmMsg)
        
        printAlert(msg: alarmMsg)
        count += 1
      defaults.set("\(alarmMsg)", forKey: "Alarm-\(count)")
        print( "print the default value Alarm - \(defaults.string(forKey: "Alarm-\(count)") ?? "error")")

        self.scheduleLocalNotification()
    }
    
    

 
    func scheduleLocalNotification(){
        print("localNotification called")
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!",
                                                                arguments: nil)
        content.sound = UNNotificationSound.default()
        
        dateInfo.hour = 11
        dateInfo.minute = 21
        // Configure the trigger for a 7am wakeup.
        let trigerTimer = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigerTimer)
        
        //UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request){(error : Error?) in
            
            if let theError = error {
                                print(theError.localizedDescription)
                            }
        }

       
        
    }
    
    
    
}

