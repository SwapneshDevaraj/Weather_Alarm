//
//  MinuteCircle.swift
//  Weather_Alarm
//
//  Created by IOS1 on 09/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class MinuteCircle: UIView
{
    
    override func draw(_ rect: CGRect)
    {
        
        
        let ctx1 = UIGraphicsGetCurrentContext()
        let rad = self.frame.size.width*0.51//radius*
        //   let endAngle = CGFloat(Double.pi*2)
        
        // add the circle to the context
        //        ctx1?.addArc(center:self.center, radius: rad, startAngle: 0, endAngle: endAngle, clockwise: true)
        //        ctx1?.setFillColor(UIColor.gray.cgColor)
        //        ctx1?.setStrokeColor(UIColor.red.cgColor)
        //        ctx1?.setLineWidth(4.0)
        //        ctx1?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        ClockFace.secondMarkers(ctx: ctx1!, x: rect.midX, y: rect.midY, radius: rad, sides: 60, color: UIColor.white)
        ClockFace.drawMinuteText(rect: rect, ctx: ctx1!, x: rect.midX, y: rect.midY, radius: rad, sides: 12, color: UIColor.white)
    }
    
    
    
    
}
