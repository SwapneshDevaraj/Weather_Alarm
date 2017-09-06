//
//  BaseCircle.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class BaseCircle: UIView {

    
    let baseCircle = UIView()
    
    var weatherView = Weather()
    var timerView = TimerView()
    
    let progressPath = CAShapeLayer()
    let progressBar = CAShapeLayer()
    
    var timescheduler : Timer! = nil
    
    var animation : CABasicAnimation!
    
    var boolTest  = true
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        baseCircle.backgroundColor = UIColor.fadedBlack
        
        baseCircle.clipsToBounds = true
        
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: darkBlur)
        
        self.backgroundColor = .clear
        
        blurView.frame = baseCircle.bounds
        
        
        baseCircle.addSubview(weatherView)
        baseCircle.addSubview(timerView)
        
        self.sendSubview(toBack: baseCircle)
        self.addSubview(baseCircle)
        layer.addSublayer(progressPath)
        
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        
       // self.animateCircle()
        self.start()
        
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
                
        baseCircle.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        baseCircle.layer.cornerRadius = (baseCircle.frame.width)/2
        baseCircle.center = CGPoint(x: self.frame.size.width*0.5 ,y: self.frame.size.height*0.5)
        
//        circle.frame = CGRect(x: 0, y: 0, width: baseCircle.frame.size.width*0.9, height: baseCircle.frame.size.width*0.9)
//        circle.center = CGPoint(x: self.frame.size.width*0.5 ,y: self.frame.size.height*0.5)
        
        
        weatherView.frame = CGRect(x: (baseCircle.frame.size.width*0.5) - (baseCircle.frame.size.width*0.3), y: baseCircle.frame.origin.y+baseCircle.frame.size.height*0.1, width: baseCircle.frame.size.width*0.6, height: baseCircle.frame.size.height*0.35)
        timerView.frame  = CGRect(x: (baseCircle.frame.size.width*0.5) - (baseCircle.frame.size.width*0.7)*0.5, y: weatherView.frame.origin.y+weatherView.frame.size.height, width: baseCircle.frame.size.width*0.7, height: baseCircle.frame.size.height*0.3 )
        
        
    }
    override func draw(_ rect: CGRect)
    {
        layer.addSublayer(progressPath)
        let path = UIBezierPath(arcCenter: CGPoint(x: baseCircle.frame.width*0.5, y: baseCircle.frame.height*0.5), radius: baseCircle.frame.size.width*0.5-8, startAngle: CGFloat(3*Double.pi/2 + Double.pi*40/180), endAngle: CGFloat(Double.pi + Double.pi*50/180), clockwise: true)
        
        
        progressPath.path = path.cgPath
        progressPath.fillColor = UIColor.clear.cgColor
        progressPath.strokeColor = UIColor.gray.cgColor
        progressPath.lineWidth = 16
        baseCircle.layer.addSublayer(progressPath)
        
        progressBar.path = path.cgPath
        progressBar.fillColor = UIColor.clear.cgColor
        progressBar.strokeColor = UIColor.myGrey.cgColor
        progressBar.lineWidth = 16
        
        progressBar.strokeEnd = 0.0
        
        baseCircle.layer.addSublayer(progressBar)
        
        
        self.bringSubview(toFront: weatherView)
        self.bringSubview(toFront: timerView)
        
    }
    
    
    func animateCircle(fromVal: Double, sduration: Double, toValue: Double)
    {
        animation.duration = CFTimeInterval(sduration)
        
        animation.fromValue = fromVal
        animation.toValue = toValue
        progressBar.removeAnimation(forKey: "strokeEnd")
        progressBar.add(animation, forKey: "strokeEnd")
        
        timerView.updatetime()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start ()
    {
        let now = Date()
        let calendar = Calendar.current
        
        let seconds = calendar.component(.second, from:  now)
        
        let fromVal : Double = Double(seconds)/60.0
        
        if((timescheduler) != nil)
        {
            timescheduler.invalidate()
            timescheduler = nil
        }
        
        if(fromVal < 1)
        {
            if(boolTest)
            {
                boolTest = false
                
                let now = Date()
                let calendar = Calendar.current
                
                let seconds = calendar.component(.second, from:  now)

                let ifDuration = 4.0
                
                let callTimer = ifDuration - 0.05
                
                let startval = -0.1
               
                self.animateCircle(fromVal: startval, sduration: Double(ifDuration), toValue: Double(seconds+4)/60.0)
             
                timescheduler = Timer.scheduledTimer(timeInterval: TimeInterval(callTimer), target: self, selector: #selector(self.start), userInfo: nil, repeats: false)
                
            }
            else
            {
                let sduration = 60 - seconds
                timescheduler = Timer.scheduledTimer(timeInterval: TimeInterval(sduration), target: self, selector: #selector(self.start), userInfo: nil, repeats: false)
                self.animateCircle(fromVal: fromVal, sduration: Double(sduration), toValue: 1)
            }
            
        }
        else
        {
            timescheduler = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.callAnimation), userInfo: nil, repeats: true)
            
        }
    }
    
    func callAnimation()
    {
        self.animateCircle(fromVal: 0, sduration: 60, toValue: 1)
    }
    
    
    func invalidateTimer() {
        if(timescheduler != nil){
           boolTest = true
            timescheduler.invalidate()
        }
        timescheduler = nil
    }
    
    func setWeatherText(temp: String, maxTemp: String, minTemp: String, location: String)
    {
        weatherView.temp.text = temp
        weatherView.maxTemp.text = maxTemp
        weatherView.minTemp.text = minTemp
        weatherView.location.text = location
        
        weatherView.addShadowtoLabels()
    }
    
    
    
}
