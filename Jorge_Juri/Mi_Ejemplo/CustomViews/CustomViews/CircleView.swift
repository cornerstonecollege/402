//
//  CircleView.swift
//  CustomViews
//
//  Created by Luiz on 2016-10-13.
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// the code below is in case that you will need an initial point
//    let initialPoint: CGPoint
//    
//    init(frame: CGRect, point: CGPoint) {
//        super.init(frame:frame)
//        self.initialPoint = point
//    }
    
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
        
        //make the triangle
        let lastPoint = CGPoint(x: rect.size.width, y: rect.size.height)
        pen.move(to: lastPoint)
        pen.addLine(to: center)
        pen.addLine(to: CGPoint(x: center.x, y: center.y + 20))
        pen.addLine(to: lastPoint)
        pen.close()
        
        // configure and paint it
        //pen.lineWidth = 10.0
        //pen.setStrokeColor(color: UIColor.clear)
        //pen.stroke()
        pen.setFillColor(color: UIColor.blue)
        pen.fill()
        
//        pen.move(to: rect.origin)
//        pen.addLine(to: CGPoint(x: rect.width, y: rect.height))
//        pen.lineWidth = 10.0
//        // We are avoiding to do UIColor.black.setStroke()
//        pen.setStrokeColor(color: UIColor.black)
//        pen.stroke()
    }
}
