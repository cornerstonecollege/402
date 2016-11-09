//
//  AnnotationView.swift
//  Maps
//
//  Created by Luiz on 2016-11-08.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.frame.size.width = 50
        self.frame.size.height = 50
        self.backgroundColor = UIColor.red
        self.centerOffset = CGPoint(x:24, y:24);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
