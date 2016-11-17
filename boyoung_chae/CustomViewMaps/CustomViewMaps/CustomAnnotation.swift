//
//  CustomAnnotation.swift
//  CustomViewMaps
//
//  Created by Boyoung on 2016-11-08.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }

}
