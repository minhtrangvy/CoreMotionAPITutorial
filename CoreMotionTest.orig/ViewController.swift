//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Minhtrang Vy on 9/30/15.
//  Copyright © 2015 minhtrangvy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    // Instance Variables
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    
    // The manager allows us to access the accelerometer and gyroscope
    var motionManager = CMMotionManager()
    
    // Outlets
    @IBOutlet var accX: UILabel?
    @IBOutlet var accY: UILabel?
    @IBOutlet var accZ: UILabel?
    @IBOutlet var MaxAccX: UILabel?
    @IBOutlet var MaxAccY: UILabel?
    @IBOutlet var MaxAccZ: UILabel?
    
    @IBAction func resetMaxValues() {
        currentMaxAccelX = 0
        currentMaxAccelY = 0
        currentMaxAccelZ = 0
    }
    
    override func viewDidLoad() {
        self.resetMaxValues()
        
        // Set motion manager properties
        motionManager.accelerometerUpdateInterval = 0.2
        
        // Start recording data
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!,
            withHandler: {
                (accelerometerData: CMAccelerometerData?, error: NSError?) -> Void
                in self.outputAccelerationData(accelerometerData!.acceleration)
                if (error != nil) {
                    print("\(error)")
                }
            }
        )
        
//        self.motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue(),
//            withHandler: {
//                (accelerometerData: CMAccelerometerData!, error: NSError!)
//                in self.outputAccelerationData(accelerometerData.acceleration) {
//                    if (error != nil) {
//                        println("\(error)")
//                    }
//                }
//            }
//        )
        
        super.viewDidLoad()
    }
    
    func outputAccelerationData(acceleration: CMAcceleration) {
        
        accX?.text = "\(acceleration.x).2fg"
        if fabs(acceleration.x) > fabs(currentMaxAccelX) {          //fabs = floating point absolute value
            currentMaxAccelX = acceleration.x
        }
        
        accY?.text = "\(acceleration.y).2fg"
        if fabs(acceleration.y) > fabs(currentMaxAccelY) {
            currentMaxAccelY = acceleration.y
        }
        
        accZ?.text = "\(acceleration.z).2fg"
        if fabs(acceleration.z) > fabs(currentMaxAccelZ) {
            currentMaxAccelZ = acceleration.z
        }
        
        MaxAccX?.text = "\(currentMaxAccelX) .2f"
        MaxAccY?.text = "\(currentMaxAccelX) .2f"
        MaxAccZ?.text = "\(currentMaxAccelX) .2f"
    }
    
    // Dispose of any resources that can b recreated
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

