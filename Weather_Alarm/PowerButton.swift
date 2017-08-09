//
//  PowerButton.swift
//  Weather_Alarm
//
//  Created by IOS1 on 09/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit

class PowerButton: UIView
{
    
    
    let setButton = UIButton()
    let timeLabel = UILabel()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        
        
        timeLabel.backgroundColor = UIColor.hexStringToUIColor(hex: "#2385D9")
        //timeLabel.alpha = 0.7
        timeLabel.text = "10  :  35"
        timeLabel.textAlignment  = .center
        self.addSubview(timeLabel)
        
        
        setButton.showsTouchWhenHighlighted = true
        setButton.setTitle("Set", for: .normal)
        setButton.setTitleColor(UIColor.black, for: .normal)
        setButton.backgroundColor = UIColor.hexStringToUIColor(hex: "#2385D9")
        //setButton.alpha = 0.8
        setButton.layer.shadowOpacity = 0.7
        setButton.layer.shadowRadius = 5
        setButton.layer.shadowColor = UIColor.black.cgColor
        self.addSubview(setButton)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        //Button round
        setButton.frame=CGRect(x: 0, y: 0 ,width: self.frame.size.width, height: self.frame.size.width)
        setButton.center = CGPoint(x: self.frame.size.width*0.5, y: self.frame.size.height*0.5)
        setButton.layer.cornerRadius = (self.frame.size.width)*0.5
        
        //Rectangle Button
        
        timeLabel.frame=CGRect(x: (setButton.frame.size.width)-setButton.frame.size.width*0.1, y: setButton.frame.origin.y+setButton.frame.size.height*0.25, width: setButton.frame.size.width*1.4,
                               height: setButton.frame.size.height*0.5)
        
    }
}

