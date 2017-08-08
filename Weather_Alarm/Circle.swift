//
//  Circle.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class Circle: UIView
{
    var circle = UIView()
    var weatherView = Weather()
    var timerView = TimerView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        circle.backgroundColor = UIColor.fadedBlack
        
        circle.clipsToBounds = true
        
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: darkBlur)
        
        self.backgroundColor = .clear
        
        blurView.frame = circle.bounds
        
        self.addSubview(circle)
        
        circle.addSubview(weatherView)
        circle.addSubview(timerView)
        
        
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        
        
        circle.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        circle.layer.cornerRadius = (circle.frame.width)/2
        circle.center = CGPoint(x: self.frame.size.width*0.5 ,y: self.frame.size.height*0.5)
        
        
        
        weatherView.frame = CGRect(x: (circle.frame.size.width*0.5) - (circle.frame.size.width*0.3), y: circle.frame.origin.y+circle.frame.size.height*0.1, width: circle.frame.size.width*0.6, height: circle.frame.size.height*0.35)
        timerView.frame  = CGRect(x: (circle.frame.size.width*0.5) - (circle.frame.size.width*0.75)*0.5, y: weatherView.frame.origin.y+weatherView.frame.size.height, width: circle.frame.size.width*0.75, height: circle.frame.size.height*0.35 )
        
        
        //        weatherView.frame = CGRect(x: (circle.frame.size.width*0.5) - (circle.frame.size.width*0.25), y: circle.frame.size.height*0.15, width: circle.frame.size.width*0.5, height: circle.frame.size.height*0.3)
        //        timerView.frame  = CGRect(x: (circle.frame.size.width*0.5) - (circle.frame.size.width*0.69)*0.5, y: weatherView.frame.origin.y+weatherView.frame.size.height, width: circle.frame.size.width*0.69, height: circle.frame.size.height*0.3 )
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
