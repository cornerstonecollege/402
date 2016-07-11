//
//  SwiftSpeechBubble.swift
//  SwiftViews
//
//  Created by Digby Andrews on 2016-06-20.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit

class SwiftSpeechBubble: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect)
    {
        let center = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        
        let path = UIBezierPath()
        
        path.addArcWithCenter(center, radius: self.frame.size.width / 2 - 5, startAngle: 0, endAngle: CGFloat(M_PI) * 2, clockwise: true)
        
        UIColor.cyanColor().setFill()
        path.fill()
        
        let lastPoint = CGPoint(x: self.frame.size.width, y: self.frame.size.height)
        path.moveToPoint(lastPoint)
        path.addLineToPoint(center)
        path.addLineToPoint(CGPointMake(center.x, center.y * 1.5))
        path.addLineToPoint(lastPoint)
        path.closePath()
        path.fill()
        
    }
}

