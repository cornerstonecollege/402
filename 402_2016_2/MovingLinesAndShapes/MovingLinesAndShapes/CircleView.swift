//
//  Circle.swift
//  MovingLinesAndShapes
//
//  Created by Luiz on 2016-11-02.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit


extension UIBezierPath {
    // create a custom method for the pen
    func setStrokeColor(color:UIColor) {
        color.setStroke()
    }
    
    func setFillColor(color:UIColor) {
        color.setFill()
    }
}

class CircleView: UIView {
    
    weak var line1:LineView?
    weak var line2:LineView?

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let pen = UIBezierPath()
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        // make the circle
        let twoPi = CGFloat(M_PI) * 2
        pen.addArc(withCenter: center, radius: rect.size.width / 2 - 5, startAngle: 0.0, endAngle: twoPi, clockwise: true)
        
        // configure and paint it
        //pen.lineWidth = 10.0
        //pen.setStrokeColor(color: UIColor.clear)
        //pen.stroke()
        pen.setFillColor(color: UIColor.blue)
        pen.fill()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.center = touches.first!.location(in: self.superview)
    }
}
