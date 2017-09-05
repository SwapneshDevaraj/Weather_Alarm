//
//  CirclePath.swift
//  AlarmRotate
//
//  Created by user1 on 7/26/17.
//  Copyright © 2017 user1. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class CirclePath: UIView {
    
    var minCircle = MinuteCircle()
    var hourCircle = HourCircle()
    var powerButton = PowerButton()
    var days = Days()
    var shapes = Shapes()
    let alarmNotification = AlarmNotification()
    
    
    var angleDifference: CGFloat?
    var location:CGPoint?
    var startTransform = CGAffineTransform()
    static  var startingAngle:CGFloat?
    
    var flag1:Bool?
    var timeArr = [Double: Int]()
    var count = 0
    var arr : [Double : Int]!
    var viewArray = [UIView]()
     var someInt = 0
    
    var alertMsg = ""
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
       

        minCircle.backgroundColor = UIColor.hexStringToUIColor(hex: "#1E282A")
        minCircle.clipsToBounds = true
        addSubview(minCircle)
        viewArray.append(minCircle)
        
        shapes.backgroundColor = .clear
        addSubview(shapes)
        
        days.backgroundColor = .clear
        days.clipsToBounds = true
        addSubview(days)

       
        
        hourCircle.backgroundColor = UIColor.hexStringToUIColor(hex: "#424D4F")
        hourCircle.clipsToBounds = true
        addSubview(hourCircle)
        
        powerButton.backgroundColor = .clear
        addSubview(powerButton)
        
        
        self.arr = getMyValues()
        
       
       
        
       
        
    }
    
 
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()

                minCircle.bounds = CGRect(x:0.0 , y: 0.0, width: self.bounds.size.width*0.66, height: self.bounds.size.width*0.66)
                minCircle.center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
                minCircle.layer.cornerRadius = minCircle.bounds.size.width*0.5
                
                hourCircle.bounds = CGRect(x: 0.0, y: 0, width: self.bounds.size.width*0.45, height: self
                    .bounds.size.width*0.45)
                hourCircle.center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
                hourCircle.layer.cornerRadius = hourCircle.bounds.size.width*0.5
                
                powerButton.bounds = CGRect(x: 0.0, y: 0.0, width: self.bounds.size.width*0.55, height:self.bounds.size.width*0.2)
                powerButton.center = CGPoint(x: self.bounds.midX + self.bounds.midX*0.4, y: self.bounds.size.height*0.5)
                powerButton.layer.cornerRadius = powerButton.bounds.size.width*0.5
                
                days.bounds = CGRect(x: 0.0, y: 0.0, width: self.bounds.size.width, height: self.bounds.size.height)
                days.center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.45)
                
                shapes.bounds = CGRect(x: 0.0, y: 0.0, width: self.bounds.size.width, height: self.bounds.size.height)
                shapes.center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
        
        
                
               
    }
  
    func getMyValues() -> [Double:Int]
    {
        
        var newArr = [Double: Int]()
        
        newArr.updateValue(11, forKey: Double(0.5))
        newArr.updateValue(10, forKey: Double(1.0))
        newArr.updateValue(9, forKey: Double(1.5))
        newArr.updateValue(8, forKey: Double(2.0))
        newArr.updateValue(7, forKey: Double(2.6))
        newArr.updateValue(6, forKey: Double(3.1))
        newArr.updateValue(5, forKey: Double(-2.6))
        newArr.updateValue(4, forKey: Double(-2.0))
        newArr.updateValue(3, forKey: Double(-1.5))
        newArr.updateValue(2, forKey: Double(-1.0))
        newArr.updateValue(1, forKey: Double(-0.5))
        newArr.updateValue(12, forKey: 0.0)
        
        
        return newArr
    }

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        for firsttouch in touches {
            if firsttouch == touches.first!{
                let location = firsttouch.location(in:self)

               for myview in viewArray{
                
                if myview.frame.contains(location)
                {
                
                flag1 = true
                
                startTransform = minCircle.transform
                }
            }
                if firsttouch.view == hourCircle.self{
                
                flag1 = false
                
                startTransform = hourCircle.transform
                }
                else {
                    
                }
                let dx = location.x - self.center.x
                let dy = location.y - self.center.y
                // Store angle
                
                CirclePath.startingAngle = atan2(dy, dx)
             }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for firsttouch in touches {

            let location = firsttouch.location(in:self)
            let dx = location.x - self.center.x
            let dy = location.y - self.center.y
            
            let angle = atan2(dy, dx)
            angleDifference = CirclePath.startingAngle! - angle
          
            if (flag1 == true)
            {
                let radians = atan2f(Float(minCircle.transform.b), Float(minCircle.transform.a))
                
              //  print(radians)
                updateMinuteLabel(radian: Double(radians).rounded(toPlaces: 1))
                
                minCircle.transform = CGAffineTransform(rotationAngle: -angleDifference!).concatenating(startTransform)
               
                
            }
            else if (flag1 != true && firsttouch.view == hourCircle)
            {
                let radians = atan2f(Float(hourCircle.transform.b), Float(hourCircle.transform.a))
                
              //  print(radians)
                updateHourLabel(radian: Double(radians).rounded(toPlaces: 1))
                
                hourCircle.transform = CGAffineTransform(rotationAngle: -angleDifference!).concatenating(startTransform)
            }

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
    let radians = atan2f(Float(minCircle.transform.b), Float(minCircle.transform.a))
    
        flag1 = nil
    }
    
    func distancefromCentre(point:CGPoint) -> CGFloat
    {
        let center = CGPoint(x: self.frame.size.width*0.5, y: self.frame.size.height*0.5)
        let dx:CGFloat = point.x - center.x;
        let dy:CGFloat = point.y - center.y;
        return CGFloat(sqrtf(Float(dx*dx + dy*dy)))
        
    }


    
    func updateMinuteLabel(radian : Double)
    {
       // print(radian)
        
        if arr.index(forKey: radian) == nil {
           // print("the key 'someKey' is NOT in the dictionary")
        }
        else
        {
            
                if(arr[radian]!*5 == 60)
                {
                    PowerButton.time2Label.text = "00"
                }
                else
                {
                    PowerButton.time2Label.text = "\(arr[radian]!*5 )"
                }
                
            }
        }
    
    
    
    func updateHourLabel(radian : Double)
    {
        if arr.index(forKey: radian) == nil {

        }
        else
        {
                PowerButton.timeLabel.text = "\(arr[radian] ?? 000) :"
            }
    }
    

    
        
    }
























