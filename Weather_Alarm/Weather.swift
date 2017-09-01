//
//  Weather.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import UIKit


class Weather: UIView
{
    
    var temp = UILabel()
    var minTemp = UILabel()
    var maxTemp = UILabel()
    var location = UILabel()
    var line = UIView()
    
    private var lat : Double = 0.0
    private var lon : Double = 0.0
    
   
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        
        
        temp.textColor = UIColor.myGrey
        
        temp.numberOfLines = 1;
        temp.adjustsFontSizeToFitWidth = true;
        temp.backgroundColor = UIColor.fadedBlack
        temp.font = UIFont.boldSystemFont(ofSize: temp.font.pointSize)
        temp.layer.borderWidth = 0
        temp.layer.borderColor = UIColor.clear.cgColor
        temp.backgroundColor = .clear

        
        
        self.addSubview(temp)
        
        //maxTemp
        
        maxTemp.textColor = .red
        maxTemp.numberOfLines = 1
        maxTemp.adjustsFontSizeToFitWidth = true
        maxTemp.backgroundColor = UIColor.fadedBlack
        maxTemp.layer.borderWidth = 0
        maxTemp.layer.borderColor = UIColor.clear.cgColor
        maxTemp.backgroundColor = .clear

        
        
        self.addSubview(maxTemp)
        
        //minTemp
        
        let myBlue = "#3BB0E3"
        minTemp.textColor = UIColor.hexStringToUIColor(hex: myBlue)
        minTemp.numberOfLines = 1
        minTemp.adjustsFontSizeToFitWidth = true
        minTemp.backgroundColor = UIColor.fadedBlack
        minTemp.layer.borderWidth = 0
        minTemp.layer.borderColor = UIColor.clear.cgColor
        minTemp.backgroundColor = .clear

        self.addSubview(minTemp)
        
        //location
        
        location.textColor = UIColor.myGrey
        location.numberOfLines = 1
        location.adjustsFontSizeToFitWidth = true
        location.backgroundColor = UIColor.fadedBlack
        location.textAlignment = .center
        location.layer.borderWidth = 0
        location.layer.borderColor = UIColor.clear.cgColor
        location.backgroundColor = .clear

        
        self.addSubview(location)
        
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        temp.frame = CGRect(x: (self.frame.size.width*0.5)-((self.frame.size.width*0.35)*0.5), y: 0, width: self.frame.size.width*0.35, height:(self.frame.size.height*0.50) )
        
        maxTemp.frame = CGRect(x: 0, y: temp.frame.origin.y+(self.frame.size.height*0.65)*0.1, width: (self.frame.size.width*0.35)*0.75, height:(self.frame.size.height*0.65)*0.75 )
        
        minTemp.frame = CGRect(x: self.frame.size.width-(self.frame.size.width*0.35)*0.75, y: temp.frame.origin.y+(self.frame.size.height*0.65)*0.1, width: (self.frame.size.width*0.35)*0.75, height:(self.frame.size.height*0.65)*0.75 )
        
        location.frame = CGRect(x: 0, y: minTemp.frame.origin.y+minTemp.frame.size.height, width: self.frame.size.width, height:self.frame.size.height*0.30 )
        
        
        
    }
    
    
    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        
        temp.font = UIFont.systemFont(ofSize: temp.frame.size.height)
        temp.font = UIFont.boldSystemFont(ofSize: temp.font.pointSize)
        
        minTemp.font = UIFont.systemFont(ofSize: minTemp.frame.size.height)
        minTemp.font = UIFont.boldSystemFont(ofSize: minTemp.font.pointSize)
        
        maxTemp.font = UIFont.systemFont(ofSize: maxTemp.frame.size.height)
        maxTemp.font = UIFont.boldSystemFont(ofSize: maxTemp.font.pointSize)
        
        location.font = UIFont.systemFont(ofSize: location.frame.size.height)
        location.font = UIFont.boldSystemFont(ofSize: location.font.pointSize)
        
    }
    
    
    
        
    func addShadowtoLabels()
    {
        temp.attributedText = NSShadow.getShadow(temp.text!,2,(temp.frame.size.height+temp.frame.size.height*0.5)*0.1)
        minTemp.attributedText = NSShadow.getShadow(minTemp.text!,2,(minTemp.frame.size.height+minTemp.frame.size.height*0.5)*0.1)
        maxTemp.attributedText = NSShadow.getShadow(maxTemp.text!,2,(maxTemp.frame.size.height+maxTemp.frame.size.height*0.5)*0.1)
        location.attributedText = NSShadow.getShadow(location.text!,2,(location.frame.size.height+location.frame.size.height*0.5)*0.1)
    }
    
       
    
}
