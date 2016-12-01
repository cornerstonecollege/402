//
//  ViewController.swift
//  AccelerometerAndGyroscope
//
//  Created by Boyoung on 2016-11-10.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var lblAccelerometerX: UILabel!
    @IBOutlet weak var lblAccelerometerY: UILabel!
    @IBOutlet weak var lblAccelerometerZ: UILabel!
    
    @IBOutlet weak var lblGyroscopeX: UILabel!
    @IBOutlet weak var lblGyroscopeY: UILabel!
    @IBOutlet weak var lblGyroscopeZ: UILabel!
    
    let motionManager = CMMotionManager()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Accelerometer
        if self.motionManager.isAccelerometerAvailable {
            self.motionManager.accelerometerUpdateInterval = 0.1
            self.motionManager.startAccelerometerUpdates(to: OperationQueue.main) {
                data, err in
                self.accelerometerData(data: data, err: err)
            }
        }
        
        // Gyroscope
        if self.motionManager.isGyroAvailable {
            self.motionManager.gyroUpdateInterval = 0.1
            self.motionManager.startGyroUpdates(to: OperationQueue.main) {
                data, err in
                self.gyroscopeData(data: data, err: err)
            }
        }
    }

    func accelerometerData(data: CMAccelerometerData?, err: Error?) -> Swift.Void {
        if err != nil {
            return
        }
        
        self.lblAccelerometerX.text = String("\(data!.acceleration.x)")!
        self.lblAccelerometerY.text = String("\(data!.acceleration.y)")!
        self.lblAccelerometerZ.text = String("\(data!.acceleration.z)")!
    }
    
    func gyroscopeData(data: CMGyroData?, err: Error?) -> Swift.Void {
        if err != nil {
            return
        }
        
        self.lblGyroscopeX.text = String("\(data!.rotationRate.x)")!
        self.lblGyroscopeY.text = String("\(data!.rotationRate.y)")!
        self.lblGyroscopeZ.text = String("\(data!.rotationRate.z)")!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

