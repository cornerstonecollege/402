//
//  MagnetometerController.swift
//  Sensors
//
//  Created by Digby Andrews on 2016-07-11.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit
import CoreMotion

class MagnetometerController: UIViewController
{
    
    
    
    override func viewDidLoad()
    {
        CoreMotionHandler.instance.startMagnetometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (data: CMMagnetometerData?, error: NSError?) in
            
        });
    }
    override func viewDidDisappear(animated: Bool) {
        CoreMotionHandler.instance.startMagnetometerUpdates()
    }

}
