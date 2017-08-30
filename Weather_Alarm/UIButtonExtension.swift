//
//  UIButtonExtension.swift
//  Weather_Alarm
//
//  Created by user1 on 8/17/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//y

import Foundation
import UIKit

class ButtonProp : UIButton
{

    var isOn :Bool = false
    
    var btnSelected = false
    func toggle() -> Bool
    {
        isOn = !isOn
        return isOn
        
    }
    
    func setDayColor(sender: UIButton, bool:Bool ,layer:CAShapeLayer ,btnTitle: String)
    {
        let color = bool ? UIColor.cyan.cgColor : UIColor.hexStringToUIColor(hex: "#16232B").cgColor
        let titleColor = bool ? UIColor.black : UIColor.white
        
        layer.strokeColor = color
        sender.setTitle(btnTitle, for: UIControlState.selected)
        sender.setTitleColor(titleColor, for: .normal)
//        print("click = \(sender.tag)")
        
        if color == UIColor.cyan.cgColor
        {
            btnSelected = true
        }
    }
    
    
    func setAmPm(sender:UIButton, bool:Bool)   {
        let title = bool ? "AM" : "PM"
        sender.setTitle(title, for: .normal)
    }
}
