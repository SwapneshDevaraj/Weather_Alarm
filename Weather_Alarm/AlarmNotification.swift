//
//  AlarmNotification.swift
//  Weather_Alarm
//
//  Created by user1 on 8/31/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import Foundation
import UIKit
import UserNotificationsUI
import UserNotifications

class AlarmNotification
{
    let defaults:UserDefaults = UserDefaults.standard
    
    
    static var alarmDays = ""
//    let requestIdentifier = "MorningAlarm"
    
    var dateInfo = DateComponents()
    

    
    func setAlarmDays(button: ButtonProp, bool:Bool)
    {
        let ans = "\(button.titleLabel?.text ?? "") "
     
        
        if(bool)
        {
            
            AlarmNotification.alarmDays += "\(button.titleLabel?.text ?? "") "
            
        }
        else {
            if let range = AlarmNotification.alarmDays.range(of: ans)
            {
               
                AlarmNotification.alarmDays.removeSubrange(range)
            }
        }
        
        
    }



}
