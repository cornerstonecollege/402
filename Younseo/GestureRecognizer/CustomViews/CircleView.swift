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
    var bubleColor = UIColor.blue   // change the bu
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CircleView.tap))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(CircleView.pinch(_:)))
        self.addGestureRecognizer(pinch)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    func tap()
    {
        let red = Float(arc4random_uniform(256))/255.0   // random 0 though 255
        let green = Float(arc4random_uniform(256))/255.0
        let blue = Float(arc4random_uniform(256))/255.0

        self.bubleColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
        self.setNeedsDisplay()  // ask the view to redraw itself
        
// Change for the backgroundColor
//        self.backgroundColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func pinch(_ pinchGesture: UIPinchGestureRecognizer)
    {
        if self.frame.size.width >= self.superview!.frame.width * 0.8 {
            return
        }
        
        let size = CGSize(width: self.frame.size.width * pinchGesture.scale, height: self.frame.size.height * pinchGesture.scale)
        let frame = CGRect(origin: self.frame.origin, size: size)
        self.frame = frame
        // replace the view to the center of the pinch gesture
        self.center = pinchGesture.location(in: self.superview)
        // ask the view
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect)
    {
        let pen = UIBezierPath()
        let center = CGPoint(x: rect.size.width/2, y: rect.size.height/2)
        
        // Make a circle
        let twoPi = M_PI * 2
        pen.addArc(withCenter: center, radius: rect.size.width / 2 - 5, startAngle: 0.0, endAngle: CGFloat(twoPi), clockwise: true)
        pen.setFillColor(color: self.bubleColor)
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
        pen.setFillColor(color: self.bubleColor)
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
        self.center = touches.first!.location(in: self.superview)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("end")
    }
}
