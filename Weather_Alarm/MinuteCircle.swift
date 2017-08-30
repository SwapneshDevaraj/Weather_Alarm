//
//  MinuteCircle.swift
//  AlarmRotate2
//
//  Created by user1 on 8/7/17.
//  Copyright © 2017 user1. All rights reserved.
//

import UIKit

class MinuteCircle: UIView
{
    var instanceMn:String = "Minute"


    override func draw(_ rect: CGRect)
    {
 
        
        let ctx1 = UIGraphicsGetCurrentContext()
     let rad = self.frame.size.width*0.51//radius*
        ClockFace.secondMarkers(ctx: ctx1!, x: rect.midX, y: rect.midY, radius: rad, sides: 60, color: UIColor.white)
        ClockFace.drawMinuteText(rect: rect, ctx: ctx1!, x: rect.midX, y: rect.midY, radius: rad, sides: 12, color: UIColor.white)

    }

    
 
}
