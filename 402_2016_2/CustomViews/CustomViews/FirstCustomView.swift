//
//  FirstCustomView.swift
//  CustomViews
//
//  Created by Luiz on 2016-10-13.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class FirstCustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red // default background color
        let label = UILabel()
        label.text = "Name"
        label.sizeToFit()
        label.center = CGPoint(x: self.frame.size.width / 2, y: 10)
        self.addSubview(label)
        
        let txtFrame = CGRect(x: (self.frame.size.width - 40) / 2, y: 50, width: 40, height: 20)
        let textView = UITextField(frame: txtFrame)
        textView.backgroundColor = UIColor.white
        self.addSubview(textView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
