//
//  ViewController.swift
//  Magnetometer
//
//  Created by Boyoung on 2016-11-10.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    enum MagenetometerSwitch {
        case ON
        case OFF
        
        func value() -> Bool {
            switch self {
            case .ON:
                return true
            default:
                return false
            }
        }
    }
    
    @IBOutlet weak var lblX: UILabel!
    @IBOutlet weak var lblY: UILabel!
    @IBOutlet weak var lblZ: UILabel!
    @IBOutlet weak var switchView: UISwitch!
    
    let motionManager = CMMotionManager()
    var firstMagneticData: CMMagnetometerData?
    var magnetomerStatuns = MagenetometerSwitch.OFF

    override func viewDidLoad() {
        super.viewDidLoad()

        self.motionManager.startMagnetometerUpdates(to: OperationQueue.main) {
            data, err in
            self.magnetometerData(data: data, err: err)
        }
    }
    
    func magnetometerData(data: CMMagnetometerData?, err: Error?) -> Swift.Void {
        if err != nil {
            return
        }
        
        // init first data for comparison
        if self.firstMagneticData == nil {
            self.firstMagneticData = data
        }
        
        // debug purposes
        self.lblX.text = String("\(data!.magneticField.x)")!
        self.lblY.text = String("\(data!.magneticField.y)")!
        self.lblZ.text = String("\(data!.magneticField.z)")!
        
        self.setSwitch(data: data)
    }

    func setSwitch(data: CMMagnetometerData?) {
        if let d = data {
            let x = abs(Int(d.magneticField.x - (firstMagneticData?.magneticField.x)!))
            let y = abs(Int(d.magneticField.y - (firstMagneticData?.magneticField.y)!))
            let z = abs(Int(d.magneticField.z - (firstMagneticData?.magneticField.z)!))
            
            // 10 is the oscilation point.
            if x > 10 || y > 10 || z > 10 {
                self.magnetomerStatuns = .ON
            } else {
                self.magnetomerStatuns = .OFF
            }
            
            self.switchView.isOn = self.magnetomerStatuns.value()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

