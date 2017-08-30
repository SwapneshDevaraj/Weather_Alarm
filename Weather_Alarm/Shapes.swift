//
//  Shapes.swift
//  Weather_Alarm
//
//  Created by user1 on 8/10/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit


class  Shapes:UIView  {
    let lineWidth = 8
    
   static var sunLayer = CAShapeLayer()
   static var monLayer = CAShapeLayer()
   static var tueLayer = CAShapeLayer()
   static  var wedLayer = CAShapeLayer()
   static var thuLayer = CAShapeLayer()
   static var friLayer = CAShapeLayer()
   static var satLayer = CAShapeLayer()

    var sunBorder = CAShapeLayer()
    var monBorder = CAShapeLayer()
    var tueBorder = CAShapeLayer()
    var wedBorder = CAShapeLayer()
    var thurBorder = CAShapeLayer()
    var friBorder = CAShapeLayer()
    var satBorder = CAShapeLayer()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.isUserInteractionEnabled = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isUserInteractionEnabled = true

       
    }
    
    override func draw(_ rect: CGRect) {
        
        layer.addSublayer(Shapes.sunLayer)
        let path1 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 170)), endAngle: CGFloat(ClockFace.degree2radian(a: 190)), clockwise: true)
        Shapes.sunLayer.path = path1.cgPath
        Shapes.sunLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.sunLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor
       // sunLayer.fillColor = UIColor.black.cgColor
        

        
        layer.addSublayer(sunBorder)
        let path11 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 170)), endAngle: CGFloat(ClockFace.degree2radian(a: 190)), clockwise: true)
        sunBorder.path = path11.cgPath
        sunBorder.lineWidth = CGFloat(lineWidth)
        sunBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        
     
        layer.addSublayer(Shapes.monLayer)
        let path2 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 192)), endAngle: CGFloat(ClockFace.degree2radian(a: 212)), clockwise: true)
        Shapes.monLayer.path = path2.cgPath
        Shapes.monLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.monLayer.fillColor = UIColor.clear.cgColor
        Shapes.monLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor

        
        layer.addSublayer(monBorder)
        let path12 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 192)), endAngle: CGFloat(ClockFace.degree2radian(a: 212)), clockwise: true)
        monBorder.path = path12.cgPath
        monBorder.lineWidth = CGFloat(lineWidth)
        monBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        
        
        
        layer.addSublayer(Shapes.tueLayer)
        let path3 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 215)), endAngle: CGFloat(ClockFace.degree2radian(a: 235)), clockwise: true)
        Shapes.tueLayer.path = path3.cgPath
        Shapes.tueLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.tueLayer.fillColor = UIColor.clear.cgColor
        Shapes.tueLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor

        
        layer.addSublayer(tueBorder)
        let path13 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 215)), endAngle: CGFloat(ClockFace.degree2radian(a: 235)), clockwise: true)
        tueBorder.path = path13.cgPath
        tueBorder.lineWidth = CGFloat(lineWidth)
        tueBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        
        
        layer.addSublayer(Shapes.wedLayer)
        let path4 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5 , y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 238)), endAngle: CGFloat(ClockFace.degree2radian(a: 260)), clockwise: true)
        Shapes.wedLayer.path = path4.cgPath
        Shapes.wedLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.wedLayer.fillColor = UIColor.clear.cgColor
        Shapes.wedLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor

        
        layer.addSublayer(wedBorder)
        let path14 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 238)), endAngle: CGFloat(ClockFace.degree2radian(a: 260)), clockwise: true)
        wedBorder.path = path14.cgPath
        wedBorder.lineWidth = CGFloat(lineWidth)
        wedBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        
        
        layer.addSublayer(Shapes.thuLayer)
        let path5 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5 , y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 263)), endAngle: CGFloat(ClockFace.degree2radian(a: 283)), clockwise: true)
        Shapes.thuLayer.path = path5.cgPath
        Shapes.thuLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.thuLayer.fillColor = UIColor.clear.cgColor
        Shapes.thuLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor
 
        
        layer.addSublayer(thurBorder)
        let path15 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 263)), endAngle: CGFloat(ClockFace.degree2radian(a: 283)), clockwise: true)
        thurBorder.path = path15.cgPath
        thurBorder.lineWidth = CGFloat(lineWidth)
        thurBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        
        
        layer.addSublayer(Shapes.friLayer)
        let path6 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5 , y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 285)), endAngle: CGFloat(ClockFace.degree2radian(a: 305)), clockwise: true)
        Shapes.friLayer.path = path6.cgPath
        Shapes.friLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.friLayer.fillColor = UIColor.clear.cgColor
        Shapes.friLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor

        
        layer.addSublayer(friBorder)
        let path16 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 285)), endAngle: CGFloat(ClockFace.degree2radian(a: 305)), clockwise: true)
        friBorder.path = path16.cgPath
        friBorder.lineWidth = CGFloat(lineWidth)
        friBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        
        
        layer.addSublayer(Shapes.satLayer)
        let path7 = UIBezierPath(arcCenter:CGPoint(x:  self.bounds.size.width*0.5 , y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.4, startAngle: CGFloat(ClockFace.degree2radian(a: 307)), endAngle: CGFloat(ClockFace.degree2radian(a: 328)), clockwise: true)
        Shapes.satLayer.path = path7.cgPath
        Shapes.satLayer.lineWidth = self.bounds.size.width*0.1
        Shapes.satLayer.fillColor = UIColor.clear.cgColor
        Shapes.satLayer.strokeColor = UIColor.hexStringToUIColor(hex: "#16232B").cgColor
  
        
        layer.addSublayer(satBorder)
        let path17 = UIBezierPath(arcCenter: CGPoint(x:  self.bounds.size.width*0.5, y: self.bounds.size.height*0.5), radius: self.bounds.size.width*0.45, startAngle: CGFloat(ClockFace.degree2radian(a: 307)), endAngle: CGFloat(ClockFace.degree2radian(a: 328)), clockwise: true)
        satBorder.path = path17.cgPath
        satBorder.lineWidth = CGFloat(lineWidth)
        satBorder.strokeColor = UIColor.hexStringToUIColor(hex: "#2385D9").cgColor
        

        
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


