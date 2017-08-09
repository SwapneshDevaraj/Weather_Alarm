//
//  TimerView.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class TimerView: UIView
{
    var timer : Timer!
    var year : UILabel!
    var time : UILabel!
    var hourAmPm : UILabel!
    var myDate : UILabel!
    var alarmImage = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.fadedBlack
        
        
        year  = UILabel()
        year.backgroundColor = UIColor.fadedBlack
        year.textColor = UIColor.myGrey
        year.textAlignment = .center
        year.numberOfLines = 1;
        year.adjustsFontSizeToFitWidth = true;
        year.font = UIFont.boldSystemFont(ofSize: year.font.pointSize)
        
        
        time  = UILabel()
        time.backgroundColor = UIColor.fadedBlack
        time.numberOfLines = 0;
        
        time.adjustsFontSizeToFitWidth = true;
        time.textColor = UIColor.myGrey
        time.textAlignment = .right
    
        
        
        
        hourAmPm  = UILabel()
        hourAmPm.backgroundColor = UIColor.fadedBlack
        hourAmPm.textColor = UIColor.myGrey
        hourAmPm.numberOfLines = 1;
        hourAmPm.adjustsFontSizeToFitWidth = true;
        
        hourAmPm.textAlignment = .center
        
        
        myDate  = UILabel()
        myDate.backgroundColor = UIColor.fadedBlack
        myDate.textColor = UIColor.myGrey
        myDate.textAlignment = .center
        myDate.numberOfLines = 1;
        myDate.adjustsFontSizeToFitWidth = true;
        
        myDate.font = UIFont.boldSystemFont(ofSize: myDate.font.pointSize)
        

        alarmImage = UIImageView(image: #imageLiteral(resourceName: "alarm"))
        alarmImage.contentMode =  UIViewContentMode.scaleAspectFit
        
        updatetime()
        
        
        self.addSubview(year)
        self.addSubview(time)
        self.addSubview(hourAmPm)
        self.addSubview(myDate)
        self.addSubview(alarmImage)
        
        
        
        
    }
    
    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        
        time.font = UIFont.systemFont(ofSize: time.frame.size.height)
        time.font = UIFont.boldSystemFont(ofSize: time.font.pointSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        year.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.size.height*0.2)
        
        time.frame = CGRect(x: (self.frame.size.width*0.1)*0.5, y: year.frame.size.height, width:self.frame.width*0.7, height: self.frame.size.height*0.8)
        
        myDate.frame = CGRect(x: 0, y: time.frame.origin.y+time.frame.size.height, width: self.frame.width, height: self.frame.size.height*0.2)
        
        alarmImage.frame = CGRect(x: time.frame.size.width+time.frame.origin.x, y: year.frame.size.height+time.frame.size.height*0.2, width: self.frame.width*0.2, height: time.frame.size.height*0.33)

        hourAmPm.frame = CGRect(x: time.frame.size.width+time.frame.origin.x, y: alarmImage.frame.origin.y+alarmImage.frame.size.height, width: alarmImage.frame.size.width, height: time.frame.size.height*0.33 )
        
        
    }
    
    
    func updatetime()
    {
        let now = Date()
        let dateFormatter = DateFormatter()
        let dateFormat = "MMMMd"
        let dd = dateFormatter.shortWeekdaySymbols[Calendar.current.component(.weekday, from: now)-1]
        dateFormatter.setLocalizedDateFormatFromTemplate(dateFormat) // set template after setting locale
        let monthAndDate = dateFormatter.string(from: now)
        
        
        myDate.text = dd+", "+monthAndDate
        myDate.attributedText = NSShadow.getShadow(myDate.text!,1,(myDate.frame.size.height+myDate.frame.size.height*0.5)*0.1)
        
        
        
        let calendar = Calendar.current
        
        
        var hour = calendar.component(.hour, from:  now)
        let minutes = calendar.component(.minute, from: now)
        
        year.text =  String(calendar.component(.year, from: now))
        year.text = (year.text!)
        year.attributedText = NSShadow.getShadow(year.text!, 1, (year.frame.size.height+year.frame.size.height*0.5)*0.1)
        
        
        if hour > 12
        {
            hour -= 12
            hourAmPm.text = "PM"
        }
        else if hour == 12
        {
            hourAmPm.text = "PM"
        }
        else
        {
            hourAmPm.text = "AM"
            
        }
        
        time.text = padZero(hour)+":"+padZero(minutes)
        
        time.attributedText = NSShadow.getShadow(time.text!, 2, (time.frame.size.height+time.frame.size.height*0.5)*0.1)
        
        
        
    }
    
    
    func padZero(_ num: Int) -> String
    {
        let numb2 = (num < 10 ? "0" : "") + String(num)
        return numb2
        
    }
    
        
}

