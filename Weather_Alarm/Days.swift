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

  
    let buttoObj = ButtonProp()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
       
        sunButton.backgroundColor = .clear
        //sunButton.alpha = 0.6
        sunButton.setTitle("Sun", for: .normal)
       // sunButton.titleLabel?.adjustsFontSizeToFitWidth = true
        sunButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        sunButton.tag = 1
        sunButton.showsTouchWhenHighlighted = true
        sunButton.clipsToBounds = true
        sunButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)

        monButton.backgroundColor = .clear
        //monButton.alpha = 0.6
        monButton.tag = 2
        monButton.setTitle("Mon", for: .normal)
        monButton.titleLabel?.adjustsFontSizeToFitWidth = true
        monButton.clipsToBounds = true
        monButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        monButton.showsTouchWhenHighlighted = true
        monButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)

        
        tueButton.backgroundColor = .clear
        //tueButton.alpha = 0.6
        tueButton.tag = 3
        tueButton.setTitle("Tue", for: .normal)
        tueButton.titleLabel?.adjustsFontSizeToFitWidth = true
        tueButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        tueButton.showsTouchWhenHighlighted = true
        tueButton.clipsToBounds = true
        tueButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        wedButton.backgroundColor = .clear
        //wedButton.alpha = 0.6
        wedButton.tag = 4
        wedButton.showsTouchWhenHighlighted = true
        wedButton.titleLabel?.adjustsFontSizeToFitWidth = true
        wedButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        wedButton.setTitle("Wed", for: .normal)
        wedButton.clipsToBounds = true
        wedButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        thurButton.backgroundColor = .clear
        //thurButton.alpha = 0.6
        thurButton.tag = 5
        thurButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        thurButton.setTitle("Thu", for: .normal)
        thurButton.titleLabel?.adjustsFontSizeToFitWidth = true
        thurButton.showsTouchWhenHighlighted = true
        thurButton.clipsToBounds = true
        thurButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        friButton.backgroundColor = .clear
        //friButton.alpha = 0.6
        friButton.tag = 6
        friButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        friButton.setTitle("Fri", for: .normal)
        friButton.titleLabel?.adjustsFontSizeToFitWidth = true
        friButton.showsTouchWhenHighlighted = true
        friButton.clipsToBounds = true
        friButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        satButton.backgroundColor = .clear
        //satButton.alpha = 0.6
        satButton.tag = 7
        satButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        satButton.setTitle("Sat", for: .normal)
        satButton.titleLabel?.adjustsFontSizeToFitWidth = true
        satButton.showsTouchWhenHighlighted = true
        satButton.clipsToBounds = true
        satButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        
        //
      
        sunButton.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 270))
       
        self.addSubview(sunButton)
        
        //
       
        monButton.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 290))
       
        self.addSubview(monButton)
        
        //
        
        tueButton.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 310))
        
        self.addSubview(tueButton)
        
        //
      
        wedButton.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 340))
      
        self.addSubview(wedButton)
        
        //
        
        
        self.addSubview(thurButton)
        
        //
        
        friButton.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 25))
       
        self.addSubview(friButton)
        
        //
       
        satButton.transform = CGAffineTransform(rotationAngle: ClockFace.degree2radian(a: 45))
      
        self.addSubview(satButton)
        
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
        
        sunButton.bounds = CGRect(x: 0.0, y: 0.0, width:buttonsize , height:buttonsize*0.7)
        sunButton.center = CGPoint(x: self.bounds.size.width*0.1, y: self.bounds.size.height*0.55)
        
        //monday
      
        monButton.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize, height: buttonsize*0.7)
        monButton.center = CGPoint(x: self.bounds.size.width*0.13, y: self.bounds.size.height*0.465)
        
        //tuesday
        
        tueButton.bounds = CGRect(x: 0.0, y: 0.0, width: buttonsize, height: buttonsize*0.7)
        tueButton.center = CGPoint(x: self.bounds.size.width*0.22, y: self.bounds.size.height*0.39)
        
        //wednesday
       
        wedButton.bounds = CGRect(x: 0.0 ,y: 0.0, width: buttonsize, height: buttonsize*0.7)
        wedButton.center = CGPoint(x: self.bounds.size.width*0.36, y: self.bounds.size.height*0.34)
        
        //thursday
        
        thurButton.bounds = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize, height: buttonsize*0.7)
        thurButton.center = CGPoint(x: self.bounds.size.width*0.522, y: self.bounds.size.height*0.325)
        
        //friday
        
        friButton.bounds = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize, height: buttonsize*0.7)
        friButton.center = CGPoint(x: self.bounds.size.width*0.671, y: self.bounds.size.height*0.35)
        
        //Saturday
        
        satButton.bounds = CGRect(x: 0.0 ,y: 0.0, width: buttonsize, height: buttonsize*0.7)
        satButton.center = CGPoint(x: self.bounds.size.width*0.792, y: self.bounds.size.height*0.4)

       
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
