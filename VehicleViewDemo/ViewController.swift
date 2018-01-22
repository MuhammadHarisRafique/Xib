//
//  ViewController.swift
//  VehicleViewDemo
//
//  Created by Higher Visibility on 20/01/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navBarView: UIView!
    
    let vehiclename = ["Saloon","MPV"]
    let passenger = ["4","6"]
    
  
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .default
    }
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let count = self.vehiclename.count - 1
        let width = self.navBarView.frame.width / CGFloat(self.vehiclename.count)
        var x_axis:CGFloat = 0.0
        
        for i in 0...count {
            
             let frame = CGRect(x: x_axis, y: 0, width: width, height: 60)
             x_axis += width
             let vehicleView = VehicleUIView.instanceFromNib()
             vehicleView.lbl_vehiclename.text = self.vehiclename[i]
             vehicleView.lbl_passengerQauntity.text = self.passenger[i]
             vehicleView.frame = frame
             self.navBarView.addSubview(vehicleView)
            
        }
    }
    
    
   
}

