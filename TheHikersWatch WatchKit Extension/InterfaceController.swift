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
    
    var locationManager = CLLocationManager()
    
    var userLocationInfo = [String]()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let locationArray = locations as NSArray
        
        let location = locationArray.lastObject as! CLLocation
        
        userLocationInfo.append("\(location.coordinate.latitude)")
        userLocationInfo.append("\(location.coordinate.longitude)")
        userLocationInfo.append("\(location.altitude)")
        userLocationInfo.append("\(location.course)")
        userLocationInfo.append("\(location.speed)")
        
        print(userLocationInfo)
        
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
