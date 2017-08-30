//
//  Days.swift
//  AlarmRotate2
//
//  Created by user1 on 8/7/17.
//  Copyright © 2017 user1. All rights reserved.
//

import UIKit

class Days: UIView
{
    
    var sunButton =  ButtonProp()
    var monButton =  ButtonProp()
    var tueButton =  ButtonProp()
    var wedButton =  ButtonProp()
    var thurButton = ButtonProp()
    var friButton =  ButtonProp()
    var satButton =  ButtonProp()

    var sunView = UIView()
    var monView = UIView()
    var tueView = UIView()
    var wedView = UIView()
    var thurView = UIView()
    var friView = UIView()
    var satView = UIView()
  
    let buttoObj = ButtonProp()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
       
        sunButton.backgroundColor = .clear
        sunButton.setTitle("Sun", for: .normal)
        sunButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        sunButton.tag = 1
        sunButton.showsTouchWhenHighlighted = true
        sunButton.clipsToBounds = true
        sunButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)

        monButton.backgroundColor = .clear
        monButton.tag = 2
        monButton.setTitle("Mon", for: .normal)
        monButton.clipsToBounds = true
        monButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        monButton.showsTouchWhenHighlighted = true
        monButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)

        
        tueButton.backgroundColor = .clear
        tueButton.tag = 3
        tueButton.setTitle("Tue", for: .normal)
        tueButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        tueButton.showsTouchWhenHighlighted = true
        tueButton.clipsToBounds = true
        tueButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        wedButton.backgroundColor = .clear
        wedButton.tag = 4
        wedButton.showsTouchWhenHighlighted = true
        wedButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        wedButton.setTitle("Wed", for: .normal)
        wedButton.clipsToBounds = true
        wedButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        thurButton.backgroundColor = .clear
        thurButton.tag = 5
        thurButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        thurButton.setTitle("Thu", for: .normal)
        thurButton.showsTouchWhenHighlighted = true
        thurButton.clipsToBounds = true
        thurButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        friButton.backgroundColor = .clear
        friButton.tag = 6
        friButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        friButton.setTitle("Fri", for: .normal)
        friButton.showsTouchWhenHighlighted = true
        friButton.clipsToBounds = true
        friButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        satButton.backgroundColor = .clear
        satButton.tag = 7
        satButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        satButton.setTitle("Sat", for: .normal)
        satButton.showsTouchWhenHighlighted = true
        satButton.clipsToBounds = true
        satButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        //
        sunView.backgroundColor = .clear
        sunView.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 270))
        self.addSubview(sunView)
        sunView.addSubview(sunButton)
        
        //
        monView.backgroundColor = .clear
        monView.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 290))
        self.addSubview(monView)
        monView.addSubview(monButton)
        
        //
        tueView.backgroundColor = .clear
        tueView.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 310))
        self.addSubview(tueView)
        tueView.addSubview(tueButton)
        
        //
        wedView.backgroundColor = .clear
        wedView.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 340))
        self.addSubview(wedView)
        wedView.addSubview(wedButton)
        
        //
        thurView.backgroundColor = .clear
        self.addSubview(thurView)
        thurView.addSubview(thurButton)
        
        //
        friView.backgroundColor = .clear
        friView.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 25))
        self.addSubview(friView)
        friView.addSubview(friButton)
        
        //
        satView.backgroundColor = .clear
        satView.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 45))
        self.addSubview(satView)
        satView.addSubview(satButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.isUserInteractionEnabled = true
        
        let buttonsize  = self.bounds.size.width*0.14
        
        //sunday
        sunView.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize*0.8, height: buttonsize*0.8)
        sunView.center = CGPoint(x: self.bounds.size.width*0.1, y: self.bounds.size.height*0.5)
      
        sunButton.bounds = CGRect(x: 0.0, y: 0.0, width:buttonsize , height:buttonsize)
        sunButton.center = CGPoint(x: sunView.bounds.size.width*0.5 , y: sunView.bounds.size.height*0.5)
        
        //monday
        monView.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize*0.8, height: buttonsize*0.8)
        monView.center = CGPoint(x: self.bounds.size.width*0.13, y: self.bounds.size.height*0.415)
        
        monButton.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize, height: buttonsize)
        monButton.center = CGPoint(x: monView.bounds.size.width*0.5, y: monView.bounds.size.height*0.5)
        
        //tuesday
        tueView.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize*0.8, height: buttonsize*0.8)
        tueView.center = CGPoint(x: self.bounds.size.width*0.22, y: self.bounds.size.height*0.336)
        
        tueButton.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize, height: buttonsize)
        tueButton.center = CGPoint(x: tueView.bounds.size.width*0.4, y: tueView.bounds.size.height*0.5)
        
        //wednesday
        wedView.bounds = CGRect(x: 0.0 ,y: 0.0, width: buttonsize*0.8, height: buttonsize*0.8)
        wedView.center = CGPoint(x: self.bounds.size.width*0.36, y: self.bounds.size.height*0.285)
        
        wedButton.bounds = CGRect(x: 0.0 ,y: 0.0, width: buttonsize, height: buttonsize)
        wedButton.center = CGPoint(x: wedView.bounds.size.width*0.4, y: wedView.bounds.size.height*0.55)
        
        //thursday
        thurView.bounds = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize*0.8, height: buttonsize*0.8)
        thurView.center = CGPoint(x: self.bounds.size.width*0.525, y: self.bounds.size.height*0.275)
        
        thurButton.bounds = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize, height: buttonsize)
        thurButton.center = CGPoint(x: thurView.bounds.size.width*0.4, y: thurView.bounds.size.height*0.5)
        
        //friday
        friView.bounds = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize*0.8, height: buttonsize*0.8)
        friView.center = CGPoint(x: self.bounds.size.width*0.68, y: self.bounds.size.height*0.3)
        
        friButton.bounds = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize, height: buttonsize)
        friButton.center = CGPoint(x: friView.bounds.size.width*0.4, y: friView.bounds.size.height*0.5)
        
        //Saturday
        satView.bounds = CGRect(x: 0.0 ,y: 0.0, width: buttonsize*0.8, height: buttonsize*0.8)
        satView.center = CGPoint(x: self.bounds.size.width*0.8, y: self.bounds.size.height*0.35)
        
        satButton.bounds = CGRect(x: 0.0 ,y: 0.0, width: buttonsize, height: buttonsize)
        satButton.center = CGPoint(x: satView.bounds.size.width*0.5, y: satView.bounds.size.height*0.5)

       
    }
    
    func togglePressed(button: UIButton)
    {
        if button == sunButton
        {
          let boolVal = sunButton.toggle()
         sunButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.sunLayer, btnTitle: "S")
        }
        else if button == monButton
        {
            let boolVal = monButton.toggle()
          monButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.monLayer, btnTitle: "Mon")
        }
        else if button == tueButton
        {
            let boolVal = tueButton.toggle()
           tueButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.tueLayer, btnTitle: "Tue")
        }
        else if button == wedButton
        {
            let boolVal = wedButton.toggle()
           wedButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.wedLayer, btnTitle: "Wed")
        }
        else if button == thurButton
        {
            let boolVal = thurButton.toggle()
            thurButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.thuLayer, btnTitle: "Thu")
        }
        else if button == friButton
        {
            let boolVal = friButton.toggle()
            friButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.friLayer, btnTitle: "Fri")
        }
        else if button == satButton
        {
            let boolVal = satButton.toggle()
            satButton.setDayColor(sender: button, bool: boolVal, layer: Shapes.satLayer, btnTitle: "Sat")
        }

    }
  
    func setShapeLayer(shapeLayer: CAShapeLayer!,button: UIButton!,day: String) -> CAShapeLayer
    {
        shapeLayer.frame = button.bounds
        button.backgroundColor = .yellow
        shapeLayer.lineWidth = self.bounds.size.width*0.17
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.gray.cgColor
        
        layer.addSublayer(shapeLayer)
        button.layer.addSublayer(shapeLayer)
        
        return shapeLayer
    }

}
