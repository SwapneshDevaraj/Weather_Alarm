
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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
 
    private var showingBack = false
    
    private var setAlarmView = true
    
    var weatherView = BaseCircle()
    var alaramView = CirclePath()
    let returnButton = UIButton()
  // let alarmNotification = AlarmNotification()
    let mainView = UIView()
    
    let requestIdentifier = "MorningAlarm"
    
    var dateInfo = DateComponents()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let tableView: UITableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: 100, height: 500)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        
        
        
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bImage"))
        mainView.backgroundColor = .clear
        
        mainView.addSubview(weatherView)
        returnButton.setImage(#imageLiteral(resourceName: "alarm"), for: .normal)
        returnButton.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15)
        returnButton.addTarget(self, action: #selector(tap), for: UIControlEvents.touchUpInside)
        returnButton.backgroundColor = UIColor.fadedBlack
        self.view.addSubview(mainView)
        self.view.addSubview(returnButton)
        
        alaramView.powerButton.setButton.addTarget(self, action: #selector(setAlarm), for: UIControlEvents.touchUpInside)
        
        weatherView.start()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = "foo"
        return cell
    }
    
    func tap (){
        if showingBack{
            
            UIView.transition(from: alaramView, to: weatherView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            
            alaramView.isHidden = true
            weatherView.isHidden = false
            
            showingBack = false
            
            returnButton.setImage(#imageLiteral(resourceName: "alarm"), for: .normal)
        }
        else {
            
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

        
        if UIDevice.current.orientation.isLandscape
        {
            weatherView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.height*0.8, height: self.view.frame.size.height*0.8)
            weatherView.layer.cornerRadius = (weatherView.frame.height)/2
            weatherView.center = CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
            
            alaramView.frame = self.view.frame
            
        } else
        {
            weatherView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*0.8, height: self.view.frame.size.width*0.8)
            weatherView.layer.cornerRadius = (weatherView.frame.width)/2
            weatherView.center = self.view.center
                //CGPoint(x: self.view.frame.size.width*0.5 ,y: self.view.frame.size.height*0.5)
            
            alaramView.frame = self.view.frame
            
            self.view.bringSubview(toFront: returnButton)
          
            
        }
        
        
    }
    
    func printAlert(msg: String)
    {
        
        let alert = UIAlertController(title: "Alarm Set", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func setAlarm()
    {
        let removeColon = " :"
        var hour = (PowerButton.timeLabel.text ?? "00")
        
        if let rang = hour.range(of: removeColon){
            hour.removeSubrange(rang)
        }
        
        let min = (PowerButton.time2Label.text ?? "00")
        
        var time = ""
        
        var myHr:Int = 00

        if alaramView.powerButton.ampmButton.isOn
        {
            time = "AM"
            
           myHr = Int(hour)!
        }
        else{
            time = "PM"
           myHr = ((Int(hour))! + 12)
        }
        
        let myMin = Int(min)!
        
        
        var alarmMsg = "\(hour):\(min) \(time) \n"
        print(alarmMsg)

        
        alarmMsg += AlarmNotification.alarmDays
        
        printAlert(msg: alarmMsg)
        
        
        //count += 1
        //defaults.set("\(alarmMsg)", forKey: "Alarm-\(count)")
       // print( "print the default value Alarm - \(defaults.string(forKey: "Alarm-\(count)") ?? "error")")
        
        self.scheduleLocalNotification(myHour: myHr , myMinute: myMin)
    }
    
    func scheduleLocalNotification(myHour:Int? ,myMinute:Int?)
    {
        //print("inside notification")
        //let answer1 = UNNotificationAction(identifier: "Answer 1", title: "Dismiss", options: UNNotificationActionOptions.foreground)
        
        //create notofication
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!",
                                                                arguments: nil)
        content.badge = 1
        content.sound = UNNotificationSound(named:"Glorious.mp3")
       dateInfo.calendar = Calendar.autoupdatingCurrent
        //let calender = Calendar.autoupdatingCurrent
        dateInfo.month = dateInfo.month
        dateInfo.weekday = 2
        
        dateInfo.hour = myHour
        dateInfo.minute = myMinute
        
        print(dateInfo.month)
        // Configure the trigger for a 7am wakeup.
        
        let triggerTimer = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: triggerTimer)
        
       
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request){(error : Error?) in
            
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
        
    }

    
}

extension ViewController:UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered in foreground")
        //You can either present alert ,sound or increase badge while the app is in foreground too with ios 10
        //to distinguish between notifications
        if notification.request.identifier == requestIdentifier{
            
            completionHandler( [.alert,.sound,.badge])
            
        }
    }
    
}


