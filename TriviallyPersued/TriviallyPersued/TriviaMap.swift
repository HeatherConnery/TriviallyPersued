//
//  TriviaMap.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-11.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TriviaMap: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var triviaData  = TriviaData().triviaModel()
    
    let locationManager = CLLocationManager()
    var currentPlacemark:CLPlacemark?
    

    @IBOutlet weak var mapMKView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //mapMKView.showsUserLocation = true
        //self.locationManager.delegate = self
        
        mapSetUP()
        self.locationManager.startUpdatingLocation()
        
        
        self.locationManager.distanceFilter = 1.0
        
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "changeLocation", userInfo: nil, repeats: false)
        
    }
    
    func changeLocation() {
        var centre:CLLocationCoordinate2D = CLLocationCoordinate2DMake(44.64251, -79.387038)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.2, 0.2)
        var regionToDisplay = MKCoordinateRegionMake(centre, span)
        self.mapMKView.setRegion(regionToDisplay, animated: true)

    }
    
    func mapSetUP() {
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            self.mapMKView.showsUserLocation = true
        }
        self.locationManager.requestWhenInUseAuthorization()
        
        var centre:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.64251, -79.387038)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.2, 0.2)
        var regionToDisplay = MKCoordinateRegionMake(centre, span)
        self.mapMKView.setRegion(regionToDisplay, animated: true)
        
//        //geocoding an address
//        geoCoder.geocodeAddressString(triviaData[0].address) { (placemarks, error ) -> Void in
//            guard let placemarks = placemarks else {return}
//            self.currentPlacemark = placemarks[0]
//            
//        }

    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let defaultLocation:CLLocation = CLLocation(latitude: 43.64251, longitude: -79.387038)
        CLGeocoder().reverseGeocodeLocation(manager.location ?? defaultLocation, completionHandler: { (placemarks, error) -> Void in
            //
            if error != nil {
                print("Error" + error!.localizedDescription)
                return
            }
            guard let placemarks = placemarks else {return}
            if placemarks.count > 0 {
                let pm = placemarks[0] 
                self.displayLocationInfo(pm)
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        self.locationManager.stopUpdatingLocation()
        print(placemark.locality)
        print(placemark.postalCode)
        print(placemark.administrativeArea)
        print(placemark.country)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let geoCoder: CLGeocoder = CLGeocoder()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
