//
//  File.swift
//  Camera
//
//  Created by Luiz on 2016-11-15.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import Foundation

struct Session
{
    static let AudioString = "isAudioOn"
    static let ImageOrientationString = "imageOrientation"
    static let ImageString = "imageData"
    
    static var isAudioOn:Bool = true
    static var imageData:Data?
    static var imageOrientation:Int?
}
