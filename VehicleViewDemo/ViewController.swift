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
    var views:[VehicleUIView] = []
    var previousTag = 0
    
  
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
            
            if i == 0{
                
                vehicleView.lbl_passengerQauntity.textColor = UIColor.green
                vehicleView.lbl_vehiclename.textColor = UIColor.green
                let image = UIImage(named: "passenger.png")?.withRenderingMode(.alwaysTemplate)
                vehicleView.imageView.tintColor = UIColor.green
                vehicleView.imageView.image = image
                self.previousTag = i
                
            }
             vehicleView.frame = frame
             self.addtabgesture(myView: vehicleView,tag:i)
             self.views.append(vehicleView)
            
        }
        
        for item in self.views{
            
           self.navBarView.addSubview(item)
            
        }
        
    }
    
    @objc func abc(sender:MyTabGesture){
        
        print(sender.tag!)
        self.updateViews(previousTag: self.previousTag, newTag: sender.tag!)
        
    }
    
    func updateViews(previousTag:Int,newTag:Int){
        
        let previousSelected = self.views[previousTag]
        previousSelected.lbl_passengerQauntity.textColor = UIColor.white
        previousSelected.lbl_vehiclename.textColor = UIColor.white
        let image = UIImage(named: "passenger.png")?.withRenderingMode(.alwaysTemplate)
        previousSelected.imageView.tintColor = UIColor.white
        previousSelected.imageView.image = image
        self.views[previousTag] = previousSelected
        
        let newView = self.views[newTag]
        newView.lbl_passengerQauntity.textColor = UIColor.green
        newView.lbl_vehiclename.textColor = UIColor.green
        let newimage = UIImage(named: "passenger.png")?.withRenderingMode(.alwaysTemplate)
        newView.imageView.tintColor = UIColor.green
        newView.imageView.image = newimage
        self.views[newTag] = newView
        
        self.previousTag = newTag
        
        
    }
    func addtabgesture(myView:UIView,tag:Int){
        
        let singleTap: MyTabGesture = MyTabGesture(target: self, action: #selector(self.abc(sender:)))
        singleTap.numberOfTapsRequired = 1
        singleTap.tag = tag
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(singleTap)
        
    }
    
}

class MyTabGesture:UITapGestureRecognizer {
    
    var tag:Int?
    
}


