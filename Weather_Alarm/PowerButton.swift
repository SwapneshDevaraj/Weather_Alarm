//
//  PowerButton.swift
//  AlarmRotate2
//
//  Created by user1 on 8/7/17.
//  Copyright © 2017 user1. All rights reserved.
//

import UIKit

class PowerButton: UIView
{

    
    let setButton = UIButton()
    static let timeLabel = UILabel()
    static let time2Label = UILabel()
    let ampmButton = ButtonProp()
    var oN = false
    
    var days = Days()
    var buttonArr = [ButtonProp]()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true

        PowerButton.timeLabel.backgroundColor = UIColor.hexStringToUIColor(hex: "#2385D9")
        PowerButton.timeLabel.text = "- :"
        PowerButton.timeLabel.textColor = UIColor.white
        PowerButton.timeLabel.textAlignment  = .right
        PowerButton.timeLabel.clipsToBounds = true
        self.addSubview(PowerButton.timeLabel)
        
        PowerButton.time2Label.backgroundColor = UIColor.hexStringToUIColor(hex: "#2385D9")
        PowerButton.time2Label.text = "0"
        PowerButton.time2Label.textColor = UIColor.white
        PowerButton.time2Label.textAlignment  = .center
        PowerButton.time2Label.clipsToBounds = true
        self.addSubview(PowerButton.time2Label)
        
        
        setButton.showsTouchWhenHighlighted = true

//        setButton.setTitleColor(UIColor.white, for: .normal)
        setButton.setImage(#imageLiteral(resourceName: "power"), for: .normal)
        setButton.contentMode = UIViewContentMode.scaleAspectFit
        setButton.backgroundColor = UIColor.hexStringToUIColor(hex: "#2385D9")
        setButton.layer.shadowOpacity = 0.7
        setButton.layer.shadowRadius = 5
        setButton.layer.shadowColor = UIColor.black.cgColor
        setButton.clipsToBounds = true
       
        self.addSubview(setButton)
        
        ampmButton.backgroundColor = UIColor.hexStringToUIColor(hex: "#2385D9")
        ampmButton.alpha = 0.8
        //currentTime()
        ampmButton.setTitle("AM", for: .normal)
        ampmButton.setTitleColor(UIColor.white, for: .normal)
        ampmButton.showsTouchWhenHighlighted = true
        ampmButton.clipsToBounds = true
        ampmButton.addTarget(self, action: #selector(togglePressed(button:)), for: UIControlEvents.touchUpInside)
        self.addSubview(ampmButton)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        self.isUserInteractionEnabled = true
        
        //Button round
        setButton.bounds=CGRect(x: 0, y: 0 ,width: self.bounds.size.width*0.4, height: self.bounds.size.width*0.4)
        setButton.center = CGPoint(x: self.bounds.size.width*0.15, y: self.bounds.size.height*0.5)
        setButton.layer.cornerRadius = (setButton.bounds.size.width)*0.5
        
        //Rectangle Button
        
        PowerButton.timeLabel.bounds=CGRect(x: 0, y: 0, width: setButton.bounds.size.width*0.6,
                                    height: setButton.bounds.size.height*0.5)
        PowerButton.timeLabel.center = CGPoint(x: setButton.bounds.size.width*1.05, y: setButton.bounds.midY)
        
        PowerButton.time2Label.bounds=CGRect(x: 0, y: 0, width: setButton.bounds.size.width*0.5,
                                           height: setButton.bounds.size.height*0.5)
        PowerButton.time2Label.center = CGPoint(x: setButton.bounds.size.width*1.6, y: setButton.bounds.midY)
        
        //AM-PM Button
        ampmButton.bounds = CGRect(x: 0.0, y: 0.0, width: setButton.bounds.size.width*0.5, height: setButton.bounds.size.height*0.5)
        ampmButton.center = CGPoint(x: setButton.bounds.size.width*2.1, y: setButton.bounds.midY)
        
        
    }
    
    func togglePressed(button: UIButton)
    {
        let boolVal = ampmButton.toggle()
        ampmButton.setAmPm(sender: button, bool: boolVal)
        
    }
    
   
    
}


