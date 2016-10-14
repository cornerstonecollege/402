//
//  CircleView.swift
//  CustomViews
//
//  Created by hoconey on 2016/10/13.
//  Copyright © 2016年 younseo. All rights reserved.
//

import UIKit

extension UIBezierPath {
    func setStrokeColor(color:UIColor) {
        color.setStroke()
    }
    func setFillColor(color:UIColor){
        color.setFill()
    }
}

class CircleView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect)
    {
        let pen = UIBezierPath()
        let center = CGPoint(x: rect.size.width/2, y: rect.size.height/2)
        
        // Make a circle
        let twoPi = M_PI * 2
        pen.addArc(withCenter: center, radius: rect.size.width / 2 - 5, startAngle: 0.0, endAngle: CGFloat(twoPi), clockwise: true)
        
        pen.setFillColor(color: UIColor.blue)
        pen.fill()
        
        // Make a triangle
        let lastPoint = CGPoint(x: rect.size.width, y: rect.size.height)
        pen.move(to: lastPoint)
        pen.addLine(to: center)
        pen.addLine(to: CGPoint(x: center.x, y: center.y + 20))
        pen.addLine(to: lastPoint)
        pen.close()
        
        // Configure and paint it
        //pen.lineWidth = 10.0
        //pen.setStrokeColor(color: UIColor.black)
        //pen.stroke()
        pen.setFillColor(color: UIColor.blue)
        pen.fill()
        
        
        
//        pen.move(to: rect.origin)
//        pen.addLine(to: CGPoint(x: rect.width, y: rect.height))
//        pen.lineWidth = 10.0
//        pen.setStrokeColor(color: UIColor.black)
//        //UIColor.black.setStroke()
//        pen.stroke()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("began")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("moved")
        if touches.first != nil
        {
            self.center = touches.first!.location(in: self.superview)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("end")
    }
}
