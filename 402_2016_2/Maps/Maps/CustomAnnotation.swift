//
//  CustomAnnotation.swift
//  Maps
//
//  Created by Luiz on 2016-11-08.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {

    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?
    
    override init() {
        self.title = "Brau"
        self.subtitle = "Brau answer"
        self.coordinate = CLLocationCoordinate2DMake(42, -129)
        super.init()
    }
}
