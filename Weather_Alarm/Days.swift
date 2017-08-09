//
//  Days.swift
//  Weather_Alarm
//
//  Created by IOS1 on 09/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class Days: UIView
{
    
    var sunButton =  UIButton()
    var monButton =  UIButton()
    var tueButton =  UIButton()
    var wedButton =  UIButton()
    var thurButton = UIButton()
    var friButton =  UIButton()
    var satButton =  UIButton()
    
    var sunLayer = CAShapeLayer()
    var monLayer = CAShapeLayer()
    var tueLayer = CAShapeLayer()
    var wedLayer = CAShapeLayer()
    var thuLayer = CAShapeLayer()
    var friLayer = CAShapeLayer()
    var satLayer = CAShapeLayer()
    
    
    var sunText = CATextLayer()
    var monText = CATextLayer()
    var tueText = CATextLayer()
    var wedText = CATextLayer()
    var thuText = CATextLayer()
    var friText = CATextLayer()
    var satText = CATextLayer()
    
    var buttonArray = [UIButton]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.backgroundColor = UIColor.clear.cgColor
        sunButton.backgroundColor = .black
        sunButton.setTitle("Sun", for: .normal)
        sunButton.showsTouchWhenHighlighted = true
        sunButton.alpha = 0.5
        buttonArray.append(sunButton)
        
        
        monButton.backgroundColor = .black
        monButton.setTitle("Mon", for: .normal)
        
        //addTarget(self, action: #selector(clicked), for: UIControlEvents.touchUpInside)
        buttonArray.append(monButton)
        self.addSubview(monButton)
        
        
        tueButton.backgroundColor = .black
        tueButton.setTitle("Tue", for: .normal)
        tueButton.addTarget(self, action:Selector(("clicked:")), for: UIControlEvents.touchUpInside)
        buttonArray.append(tueButton)
        
        wedButton.backgroundColor = .black
        
        
        
        
        wedButton.setTitle("Wed", for: .normal)
        buttonArray.append(wedButton)
        
        thurButton.backgroundColor = .black
        thurButton.setTitle("Thu", for: .normal)
        buttonArray.append(thurButton)
        
        friButton.backgroundColor = .black
        friButton.setTitle("Fri", for: .normal)
        buttonArray.append(friButton)
        
        satButton.backgroundColor = .black
        satButton.setTitle("Sat", for: .normal)
        buttonArray.append(satButton)
        
        print("first element \(buttonArray[0])")
        
        
        self.addSubview(sunButton)
        
        self.addSubview(tueButton)
        self.addSubview(wedButton)
        self.addSubview(thurButton)
        self.addSubview(friButton)
        self.addSubview(satButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clicked()
    {
        print("hello rajesh")
    }
    
    
    func callingrajesh()
    {
        print("hello rajesh")
    }
    
    override func layoutSubviews()
    {
        let buttonsize  = self.frame.size.width*0.14
        
        sunButton.frame = CGRect(x: 0.0, y: 0.0, width:buttonsize , height:buttonsize )
        sunButton.center = CGPoint(x: self.frame.size.width*0.1, y: self.frame.size.height*0.5)
        
        
        monButton.frame = CGRect(x: 0.0, y: 0.0, width: buttonsize, height: buttonsize)
        monButton.center = CGPoint(x: self.frame.size.width*0.13, y: self.frame.size.height*0.41)
        
        tueButton.frame = CGRect(x: 0.0, y: 0.0, width: buttonsize, height: buttonsize)
        tueButton.center = CGPoint(x: self.frame.size.width*0.22, y: self.frame.size.height*0.25)
        
        wedButton.frame = CGRect(x: 0.0 ,y: 0.0, width: buttonsize, height: buttonsize)
        wedButton.center = CGPoint(x: self.frame.size.width*0.365, y: self.frame.size.height*0.28)
        
        thurButton.frame = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize, height: buttonsize)
        thurButton.center = CGPoint(x: self.frame.size.width*0.52, y: self.frame.size.height*0.27)
        
        friButton.frame = CGRect(x: 0.0 ,y: 0.0 , width: buttonsize, height: buttonsize)
        friButton.center = CGPoint(x: self.frame.size.width*0.67, y: self.frame.size.height*0.29)
        
        satButton.frame = CGRect(x: 0.0 ,y: 0.0, width: buttonsize, height: buttonsize)
        satButton.center = CGPoint(x: self.frame.size.width*0.82, y: self.frame.size.height*0.34)
        
    }
    
    
    // CGPoint(x: self.frame.size.width*0.45+(self.frame.size.width*0.412), y: self.frame.size.height*0.18)
    override func draw(_ rect: CGRect)
    {
        //        //sunday
        //        sunLayer = setShapeLayer(shapeLayer: sunLayer, button: sunButton, day: "Sun")
        //        let path3 = UIBezierPath(arcCenter:CGPoint(x: sunButton.frame.size.width*0.5, y: sunButton.frame.size.height*0.5), radius: self.frame.size.width*0.8, startAngle: CGFloat(Double.pi+Double.pi*3.5/180), endAngle: CGFloat(Double.pi + Double.pi*14/180), clockwise: true)
        //        sunLayer.path = path3.cgPath
        //        //sunText =  setDay(txt: sunText, button: sunButton, day: "Sun")
        //
        //
        //        //monday
        //        monLayer = setShapeLayer(shapeLayer: monLayer, button: monButton, day: "mon")
        //        let path4 = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width*0.425,y: self.frame.size.height*0.3), radius: self.frame.size.width*0.415, startAngle: CGFloat(Double.pi + Double.pi*23/180), endAngle: CGFloat(Double.pi + Double.pi*42/180), clockwise: true)
        //        monLayer.path = path4.cgPath
        //        //monText = setDay(txt: monText, button: monButton, day: "Mon")
        //
        ////        monText.fontSize = CGFloat(18)
        ////        monText.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(3*Double.pi/2)))
        ////        monText.string = "Mon"
        ////        monText.alignmentMode = String(kCAAlignmentRight)
        ////        monText.frame = CGRect(x: monButton.frame.width*0.3-20, y:  monButton.frame.size.height*0.3, width: monButton.frame.size.width*0.3, height: monButton.frame.size.height*0.3)
        ////        monButton.layer.addSublayer(monText)
        //
        //        //tuesday
        //        tueLayer = setShapeLayer(shapeLayer: tueLayer, button: tueButton, day: "Tue")
        //        let path5 = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width*0.31,y: self.frame.size.height*0.425), radius: self.frame.size.width*0.415, startAngle: CGFloat(Double.pi + Double.pi*45/180), endAngle: CGFloat(Double.pi + Double.pi*66/180), clockwise: true)
        //        tueLayer.path = path5.cgPath
        //        tueText = setDay(txt: tueText, button: tueButton, day: "Tue")
        //
        //        //wednesday
        //       // wedLayer = setShapeLayer(shapeLayer: wedLayer, button: wedButton, day: "Wed")
        //        let path6 = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width*0.145,y: self.frame.size.height*0.463), radius: self.frame.size.width*0.40, startAngle: CGFloat(Double.pi + Double.pi*69/180), endAngle: CGFloat(Double.pi + Double.pi*90/180), clockwise: true)
        //        wedLayer.path = path6.cgPath
        //        //wedText = setDay(txt: wedText, button: wedButton, day: "Wed")
        //
        //        //thursday
        //        thuLayer = setShapeLayer(shapeLayer: thuLayer, button: thurButton, day: "Thur")
        //        let path7 = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width*0.4-(self.frame.size.width*0.41),y: self.frame.size.height*0.465), radius: self.frame.size.width*0.40, startAngle: CGFloat(Double.pi + Double.pi*92/180), endAngle: CGFloat(Double.pi + Double.pi*112/180), clockwise: true)
        //        thuLayer.path = path7.cgPath
        //        thuText = setDay(txt: thuText, button: thurButton, day: "Thur")
        //
        //        //friday
        //        friLayer = setShapeLayer(shapeLayer: friLayer, button: friButton, day: "Fri")
        //        let path8 = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width*0.34-(self.frame.size.width*0.5),y: self.frame.size.height*0.413), radius: self.frame.size.width*0.40, startAngle: CGFloat(Double.pi + Double.pi*115/180), endAngle: CGFloat(Double.pi + Double.pi*135/180), clockwise: true)
        //        friLayer.path = path8.cgPath
        //        friText = setDay(txt: friText, button: friButton, day: "Fri")
        //
        //        //saturday
        //        satLayer = setShapeLayer(shapeLayer: satLayer, button: satButton, day: "Sat")
        //        let path9 = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width*0.22-(self.frame.size.width*0.5),y: self.frame.size.height*0.28), radius: self.frame.size.width*0.40, startAngle: CGFloat(Double.pi + Double.pi*138/180), endAngle: CGFloat(Double.pi + Double.pi*158/180), clockwise: true)
        //        satLayer.path = path9.cgPath
        //        satText = setDay(txt: satText, button: satButton, day: "Sat")
        //
        //
    }
    
    
    func setShapeLayer(shapeLayer: CAShapeLayer!,button: UIButton!,day: String) -> CAShapeLayer
    {
        shapeLayer.frame = button.bounds
        button.backgroundColor = .yellow
        shapeLayer.lineWidth = self.frame.size.width*0.17
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.gray.cgColor
        
        layer.addSublayer(shapeLayer)
        button.layer.addSublayer(shapeLayer)
        
        return shapeLayer
    }
    func setDay(txt: CATextLayer!, button: UIButton,day: String) ->CATextLayer
    {
        txt.fontSize = CGFloat(18)
        txt.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(3*Double.pi / 2)))
        txt.string = day
        txt.alignmentMode = String(kCAAlignmentRight)
        txt.frame = button.bounds
        
        button.layer.addSublayer(txt)
        
        return txt
    }
    
    
}
