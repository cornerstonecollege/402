//
//  Magnetometer.swift
//  Sensors
//
//  Created by CICCC1 on 2016-07-11.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import CoreMotion

class Magnetometer: UIViewController
{
    @IBOutlet weak var lblX: UILabel!

    @IBOutlet weak var lblY: UILabel!

    @IBOutlet weak var lblZ: UILabel!
    
    override func viewDidLoad()
    {
        CoreMotionHandler.instance.startMagnetometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (data: CMMagnetometerData?, error: NSError?) in
            self.lblX.text = "\(data!.magneticField.x)"
            self.lblY.text = "\(data!.magneticField.y)"
            self.lblZ.text = "\(data!.magneticField.z)"
        });
    }
    
    override func viewDidDisappear(animated: Bool) {
        CoreMotionHandler.instance.stopMagnetometerUpdates();
    }
}
