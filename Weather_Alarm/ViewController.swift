
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
    
    var weatherView = WeatherTimeView()
    var alaramView = CirclePath()
    let returnButton = UIButton()
    let mainView = UIView()
    
    let requestIdentifier = "MorningAlarm"
    
    var dateInfo = DateComponents()
    var count = 0
    var alarms = [String]()
    
    let tableView: UITableView = UITableView()
    
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
        
        alaramView.powerButton.setButton.addTarget(self, action: #selector(setAlarm), for: UIControlEvents.touchUpInside)
        
        weatherView.baseCircle.start()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 50
        alaramView.addSubview(tableView)
        
       
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
          
            tableView.frame = CGRect(x: 0, y: alaramView.frame.size.height*0.8, width: alaramView.frame.size.width, height: alaramView.frame.size.height*0.2)
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

        alarmMsg += AlarmNotification.alarmDays
        print(alarmMsg)
        
        let alarmForAraray = "\(hour):\(min) \(time) \(AlarmNotification.alarmDays)"
        
        print(alarmForAraray)
        if !(alarms.contains(alarmForAraray)){
            printAlert(msg: alarmMsg)
            count += 1
            alarms.append("\(hour):\(min) \(time) \(AlarmNotification.alarmDays)")
            dump(alarms)
            self.scheduleLocalNotification(myHour: myHr , myMinute: myMin)
        }else{
            printAlert(msg: "Alarm already exists")
        }
        
        
//        printAlert(msg: alarmMsg)
//        count += 1
//        alarms.append("Alarm-\(count)\(hour):\(min) \(time) \(AlarmNotification.alarmDays)")

        
        tableView.reloadData()
        
        //defaults.set("\(alarmMsg)", forKey: "Alarm-\(count)")
       // print( "print the default value Alarm - \(defaults.string(forKey: "Alarm-\(count)") ?? "error")")
     
        
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
        content.sound = UNNotificationSound(named:"Glorious.mp3")   //UNNotificationSound.default()
            
        
       dateInfo.calendar = Calendar.autoupdatingCurrent
        
        //let calender = Calendar.autoupdatingCurrent
        
       // dateInfo.month = dateInfo.month
        dateInfo.weekday = 2
        
        dateInfo.hour = myHour
        dateInfo.minute = myMinute
        
        
        // Configure the trigger for a 7am wakeup.
        
        let triggerTimer = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
       // let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: triggerTimer)
       
        
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request){(error : Error?) in
            
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
        
    }
  
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return tableView.rowHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      //  var cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        var cell:UITableViewCell! = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
        }
        cell.textLabel!.text = alarms[indexPath.row]
        
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor.myGrey
        
        return cell
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


