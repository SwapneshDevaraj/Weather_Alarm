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
    var circle = Circle()
    
    let progressPath = CAShapeLayer()
    let progressBar = CAShapeLayer()
    
    let timescheduler = Timer()
    
    var animation : CABasicAnimation!
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        baseCircle.backgroundColor = UIColor.fadedBlack
        
        
        baseCircle.clipsToBounds = true
        
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: darkBlur)
        
        self.backgroundColor = .clear
        
        blurView.frame = baseCircle.bounds
        
        
        baseCircle.addSubview(circle)
        self.sendSubview(toBack: baseCircle)
        self.addSubview(baseCircle)
        layer.addSublayer(progressPath)
        
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        
        self.animateCircle()
        
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        if UIDevice.current.orientation.isLandscape
        {
            print("Landscape")
            baseCircle.frame = CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height)
            baseCircle.layer.cornerRadius = (baseCircle.frame.height)/2
            baseCircle.center = CGPoint(x: self.frame.size.width*0.5 ,y: self.frame.size.height*0.5)
            print(self.frame.size.height)
            
        } else
        {
            print("Portrait")
            baseCircle.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
            baseCircle.layer.cornerRadius = (baseCircle.frame.width)/2
            baseCircle.center = CGPoint(x: self.frame.size.width*0.5 ,y: self.frame.size.height*0.5)
            print(self.frame.size.width)
        }
        
        circle.frame = CGRect(x: 0, y: 0, width: baseCircle.frame.size.width*0.9, height: baseCircle.frame.size.width*0.9)
        circle.center = CGPoint(x: self.frame.size.width*0.5 ,y: self.frame.size.height*0.5)
        
        
    }
    override func draw(_ rect: CGRect)
    {
        layer.addSublayer(progressPath)
        let path = UIBezierPath(arcCenter: CGPoint(x: baseCircle.frame.width*0.5, y: baseCircle.frame.height*0.5), radius: baseCircle.frame.size.width*0.5-8, startAngle: CGFloat(3*Double.pi/2 + Double.pi*30/180), endAngle: CGFloat(Double.pi + Double.pi*60/180), clockwise: true)
        
        
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
        
        
        self.bringSubview(toFront: circle)
        
    }
    
    
    func animateCircle()
    {
        
        let now = Date()
        let calendar = Calendar.current
        
        let seconds = calendar.component(.second, from:  now)
        
        let sduration = 60 - seconds
        
        animation.duration = CFTimeInterval(sduration)
        
        let fromVal : Double = Double(seconds)/60.0
        animation.fromValue = fromVal
        animation.toValue = 1
        progressBar.removeAnimation(forKey: "strokeEnd")
        progressBar.add(animation, forKey: "strokeEnd")
        
        
        circle.timerView.updatetime()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start ()
    {
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateCircle), userInfo: nil, repeats: true)
        
    }
    
    
    
}
