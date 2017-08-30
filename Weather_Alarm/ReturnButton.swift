//
//  ReturnButton.swift
//  Weather_Alarm
//
//  Created by user1 on 8/11/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit


class ReturnButton: UIView {
    let returnButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        returnButton.backgroundColor = UIColor.hexStringToUIColor(hex: "#16232B")
        returnButton.setTitle("<-", for: .normal)
        returnButton.setTitleColor(UIColor.white, for: .normal)
        returnButton.showsTouchWhenHighlighted = true
        self.addSubview(returnButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //return button
        returnButton.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.width)
        returnButton.center = CGPoint(x: self.frame.size.width*0.5, y: self.frame.size.height*0.5)
        returnButton.layer.cornerRadius = returnButton.frame.size.width*0.5
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
