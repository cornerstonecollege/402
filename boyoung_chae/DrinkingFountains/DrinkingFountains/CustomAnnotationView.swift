//
//  CustomAnnotationView.swift
//  DrinkingFountains
//
//  Created by Boyoung on 2016-11-09.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "WaterDrop")
        self.frame.size.width = 25
        self.frame.size.height = 25
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
