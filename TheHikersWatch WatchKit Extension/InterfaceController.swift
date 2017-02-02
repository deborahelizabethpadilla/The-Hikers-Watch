//
//  InterfaceController.swift
//  TheHikersWatch WatchKit Extension
//
//  Created by Deborah on 2/2/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation


class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet var table: WKInterfaceTable!
    
    var locationManager = CLLocationManager()
    
    var userLocationInfo = [String]()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let locationArray = locations as NSArray
        
        let location = locationArray.lastObject as! CLLocation
        
        userLocationInfo.removeAll(keepingCapacity: true)
        
        userLocationInfo.append("Lat: \(location.coordinate.latitude)")
        userLocationInfo.append("Long: \(location.coordinate.longitude)")
        userLocationInfo.append("Alt: \(location.altitude)")
        userLocationInfo.append("Speed: \(location.course)")
        userLocationInfo.append("Course: \(location.speed)")
        
        print(userLocationInfo)
        
        table.setNumberOfRows(userLocationInfo.count, withRowType: "tableRowController")
        
        for (index, value) in userLocationInfo.enumerated() {
            let row = table.rowController(at: index) as! tableRowController
            row.tableRowLabel.setText(value)
        }
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
