//
//  ClockFace.swift
//  RotatingCircle
//
//  Created by user1 on 8/7/17.
//  Copyright © 2017 user1. All rights reserved.
//

import UIKit
class ClockFace
{
   static var count = 0
   class func degree2radian(a:CGFloat)->CGFloat
    {
        let b = CGFloat(Double.pi) * a/180
        return b
    }
    
    
   class func circleCircumferencePoints(sides:Int ,x:CGFloat ,y:CGFloat ,radius:CGFloat ,adjustment:CGFloat=0) -> [CGPoint]
    {
        let angle = degree2radian(a: 360/CGFloat(sides))
        let cx = x //x origin
        let cy = y //y origin
        let r = radius //radius of a circle
        var i = sides
        var points = [CGPoint]()
        while points.count <= sides{
            let xpo = cx - r * cos(angle * CGFloat(i)+degree2radian(a: adjustment))
            let ypo = cy - r * sin(angle * CGFloat(i)+degree2radian(a: adjustment))
            points.append(CGPoint(x: xpo, y: ypo))
            i -= 1
        }
        
        
        return points
    }
    
   class func secondMarkers(ctx:CGContext ,x:CGFloat ,y:CGFloat ,radius:CGFloat ,sides:Int ,color:UIColor)
    {
        // retrieve points
        let points = circleCircumferencePoints(sides: sides, x: x, y: y, radius: radius)
        // create a path
        let path = CGMutablePath()
        // determine length of marker as a fraction of the total radius
        var divider:CGFloat = 1/16
        for p in points.enumerated(){
            if p.offset % 5 == 0{
                divider = 1/08
            }
            else{
                divider = 1/16
            }
            let xn = p.element.x + divider*(x-p.element.x)
            let yn = p.element.y + divider*(y-p.element.y)
            //build path
            path.move(to: CGPoint(x: p.element.x, y: p.element.y))
            path.addLine(to: CGPoint(x: xn, y: yn))
            path.closeSubpath()
            ctx.addPath(path)
        }
        //set path color
        let cgcolor = color.cgColor
        ctx.setStrokeColor(cgcolor)
        ctx.setLineWidth(1.5)
        ctx.strokePath()
        
    }
    
   class func drawText(rect:CGRect ,ctx:CGContext ,x:CGFloat ,y:CGFloat ,radius:CGFloat ,sides:Int ,color:UIColor)
    {
        
        ctx.translateBy(x: 0.0, y: rect.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        //dictates on how inset the ring of numbers will be
        let inset:CGFloat = radius/4.5
        //an adjustment of 270 degrees to position numbers correctly
        let points = circleCircumferencePoints(sides: sides, x: x, y: y, radius: radius-inset, adjustment: 180)
        
        for p in points.enumerated()
        {
            if p.offset > 0 {
                //default font of iphone
                let aFont = UIFont(name: "HelveticaNeue", size: radius/7)?.withSize(12)
                
                // create a dictionary of attributes to be applied to the string
                let attr:CFDictionary = [NSFontAttributeName:aFont! ,NSForegroundColorAttributeName:UIColor.white] as CFDictionary
//                if radius = 
//                {
                let string = String(format: "%02d",p.offset as CVarArg)
                // create the attributed string
                let text = CFAttributedStringCreate(nil, string as CFString, attr)
                    let line = CTLineCreateWithAttributedString(text!)
                    //retrive bounds
                    let bounds = CTLineGetBoundsWithOptions(line, CTLineBoundsOptions.useGlyphPathBounds)
                    //set the line width to stroke the text with
                    ctx.setLineWidth(1.5)
                    // set the drawing mode to stroke
                    ctx.setTextDrawingMode(CGTextDrawingMode.stroke)
                    // Set text position and draw the line into the graphics context, text length and height is adjusted for
                    let xn = p.element.x - bounds.width/2
                    let yn = p.element.y - bounds.midY
                    ctx.textPosition = CGPoint(x: xn, y: yn)
                    //draw the line of text
                    CTLineDraw(line, ctx)


            }
        }
    }
    
    class func drawMinuteText(rect:CGRect ,ctx:CGContext ,x:CGFloat ,y:CGFloat ,radius:CGFloat ,sides:Int ,color:UIColor)
    {
        ctx.translateBy(x: 0.0, y: rect.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        //dictates on how inset the ring of numbers will be
        let inset:CGFloat = radius/4.5
        //an adjustment of 270 degrees to position numbers correctly
        let points = circleCircumferencePoints(sides: sides, x: x, y: y, radius: radius-inset, adjustment: 210)
        
        for p in points.enumerated()
        {
            if p.offset > 0 {
                //default font of iphone
                let aFont = UIFont(name: "HelveticaNeue", size: radius/7)?.withSize(12)
                
                // create a dictionary of attributes to be applied to the string
                let attr:CFDictionary = [NSFontAttributeName:aFont! ,NSForegroundColorAttributeName:UIColor.white] as CFDictionary
                let string = String(format: "%02d",count as CVarArg)
                count += 5
                // create the attributed string
                let text = CFAttributedStringCreate(nil, string as CFString, attr)
                
                // create the line of text
                let line = CTLineCreateWithAttributedString(text!)
                //retrive bounds
                let bounds = CTLineGetBoundsWithOptions(line, CTLineBoundsOptions.useGlyphPathBounds)
                //set the line width to stroke the text with
                ctx.setLineWidth(1.5)
                // set the drawing mode to stroke
                ctx.setTextDrawingMode(CGTextDrawingMode.stroke)
                // Set text position and draw the line into the graphics context, text length and height is adjusted for
                let xn = p.element.x - bounds.width/2
                let yn = p.element.y - bounds.midY
                ctx.textPosition = CGPoint(x: xn, y: yn)
                //draw the line of text
                CTLineDraw(line, ctx)
            }
        }
    }
    

}
