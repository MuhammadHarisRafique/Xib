//
//  VehicleUIView.swift
//  VehicleViewDemo
//
//  Created by Higher Visibility on 20/01/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class VehicleUIView: UIView {

    @IBOutlet weak var lbl_vehiclename: UILabel!
    @IBOutlet weak var lbl_passengerQauntity: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    class func instanceFromNib() -> VehicleUIView {
        
        return UINib(nibName: "VehicleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! VehicleUIView
        
    }
}
