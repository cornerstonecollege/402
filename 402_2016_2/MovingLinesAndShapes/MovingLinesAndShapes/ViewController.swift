//
//  ViewController.swift
//  MovingLinesAndShapes
//
//  Created by Luiz on 2016-11-02.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var objArray = [CircleView]()
    var lineArray = [LineView]()
    var selectedCircle:CircleView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(_ sender: AnyObject) {
        let posX = arc4random_uniform(UInt32(self.view.frame.width - 100))
        let posY = arc4random_uniform(UInt32(self.view.frame.height - 100))
        
        let circleFrame = CGRect(x: Int(posX), y: Int(posY), width: 100, height: 100)
        let circle = CircleView(frame: circleFrame)
        //circle.backgroundColor = UIColor.yellow
        self.view.addSubview(circle)
        self.objArray += [circle]
        
        self.updateLines()
    }

    func updateLines() {
        for (idx, circle) in objArray.enumerated() {
            // clear if it is dirty
            if idx != objArray.count - 1 && circle.line1 == nil || circle.line2 == nil {
                lineArray = [LineView]()
            }
        }
        
        var circle1:CircleView?
        var circle2:CircleView?
        
        if lineArray.count == 0 && objArray.count > 1 {
            for i in 0...objArray.count - 2 {
                circle1 = objArray[i]
                circle2 = objArray[i+1]
            }
        } else if lineArray.count > 0  && objArray.count > 2 {
            circle1 = objArray[objArray.count-2]
            circle2 = objArray[objArray.count-1]
        }
        
        if circle1 != nil && circle2 != nil {
            let line = LineView(circle1: circle1!, circle2:circle2!, superView:self.view)
            self.lineArray += [line]
            self.view.addSubview(line)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            let point = touches.first!.location(in: self.view)
            for circle in self.objArray {
                if circle.frame.contains(point) {
                    self.selectedCircle = circle
                    break
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if selectedCircle != nil {
                self.selectedCircle!.center = touch.location(in: self.view)
                self.selectedCircle?.line1?.setNeedsDisplay()
                self.selectedCircle?.line2?.setNeedsDisplay()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.selectedCircle = nil
    }
}

