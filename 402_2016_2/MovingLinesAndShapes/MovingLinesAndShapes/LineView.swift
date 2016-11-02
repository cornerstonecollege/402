//
//  LineView.swift
//  MovingLinesAndShapes
//
//  Created by Luiz on 2016-11-02.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class LineView: UIView {

    unowned var circle1:CircleView
    unowned var circle2:CircleView
    
    init(circle1: CircleView, circle2: CircleView, superView: UIView) {
        self.circle1 = circle1
        self.circle2 = circle2
        super.init(frame: superView.frame)
        self.backgroundColor = UIColor.clear
        self.layer.zPosition = -10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.circle1.line2 = self
        self.circle2.line1 = self
        
        let pen = UIBezierPath()
        pen.move(to: self.circle1.center)
        pen.addLine(to: self.circle2.center)
        pen.setStrokeColor(color: UIColor.black)
        pen.lineWidth = 2
        pen.stroke()
    }
}
