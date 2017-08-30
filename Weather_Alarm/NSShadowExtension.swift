//
//  NSShadowExtension.swift
//  Weather_Alarm
//
//  Created by IOS1 on 08/08/17.
//  Copyright © 2017 HighPeak. All rights reserved.
//

import Foundation
import UIKit

extension NSShadow
{
    static func getShadow(_ name: String, _ width: CGFloat, _ height: CGFloat ) -> NSAttributedString
    {
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: width, height: height)
        myShadow.shadowColor = UIColor.black.withAlphaComponent(0.1)
        
        // Create an attribute from the shadow
        let myAttribute = [ NSShadowAttributeName: myShadow ]
        
        // Add the attribute to the string
        let myAttrString = NSAttributedString(string: name, attributes: myAttribute)
        
        return myAttrString
        
    }
    
}
