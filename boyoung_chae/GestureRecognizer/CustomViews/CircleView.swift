//
//  CircleView.swift
//  CustomViews
//
//  Created by Boyoung on 2016-10-13.
//  Copyright © 2016 Boyoung. All rights reserved.
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
    
    var bubbleColor = UIColor.blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CircleView.tap))
        
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(CircleView.pinch(_:)))
        self.addGestureRecognizer(pinch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func tap() {
        
        let red = Float(arc4random_uniform(256)) / 255.0   // random 0 through 255
        let green = Float(arc4random_uniform(256)) / 255.0
        let blue = Float(arc4random_uniform(256)) / 255.0
        
        // we don't want to change the background color.
//        self.backgroundColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
        
        self.bubbleColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
        self.setNeedsDisplay()  // ask the view to redraw itself
    }
    
    func pinch(_ pinchGesture: UIPinchGestureRecognizer) {
    
//        if pinchGesture.scale <= 0.5 || pinchGesture.scale >= 1.5 {
//            return
//        }
        
        if self.frame.size.width >= self.superview!.frame.width * 0.8 {
            return
        }
        
        let size = CGSize(width: self.frame.size.width * pinchGesture.scale,
                          height: self.frame.size.height * pinchGesture.scale)
        let frame = CGRect(origin: self.frame.origin, size: size)
        
        self.frame = frame
        
        // replace the view to the center of the pinch gesture
        self.center = pinchGesture.location(in: self.superview)
        
        // aks the view to redraw itself
        self.setNeedsDisplay()
    }

    
    // the code below is in case that you will need an initial point
//        let initialPoint: CGPoint
//    
//        init(frame: CGRect, point: CGPoint) {
//            super.init(frame:frame)
//            self.initialPoint = point
//        }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let pen = UIBezierPath()
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        // make the circle
        let twoPi = CGFloat(M_PI) * 2
        pen.addArc(withCenter: center, radius: rect.size.width / 2 - 5, startAngle: 0.0, endAngle: twoPi, clockwise: true)
        
        // configure and paint it
//        pen.lineWidth = 10.0
//        pen.setStrokeColor(color: UIColor.clear)
//        pen.stroke()
        pen.setFillColor(color: self.bubbleColor)
        pen.fill()
        
        //make the triangle
        let lastPoint = CGPoint(x: rect.size.width, y: rect.size.height)
        pen.move(to: lastPoint)
        pen.addLine(to: center)
        pen.addLine(to: CGPoint(x: center.x, y: center.y + 20))
        pen.addLine(to: lastPoint)
        pen.close()
        
        // configure and paint it
//        pen.lineWidth = 10.0
//        pen.setStrokeColor(color: UIColor.clear)
//        pen.stroke()
        pen.setFillColor(color: self.bubbleColor)
        pen.fill()
        
//                pen.move(to: rect.origin)
//                pen.addLine(to: CGPoint(x: rect.width, y: rect.height))
//                pen.lineWidth = 10.0
//                // We are avoiding to do UIColor.black.setStroke()
//                pen.setStrokeColor(color: UIColor.black)
//                pen.stroke()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.center = touches.first!.location(in: self.superview)
        print("touches moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
    }
}
