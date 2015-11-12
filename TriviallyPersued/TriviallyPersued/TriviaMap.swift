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
    //let geoCoder: CLGeocoder = CLGeocoder()
    

    @IBOutlet weak var mapMKView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // location manager code
        self.locationManager.delegate = self
        self.mapMKView.delegate = self
        // start updating location
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestWhenInUseAuthorization()
        self.mapMKView.showsUserLocation = true
        
//        let cnTower = MapPin(coordinate: CLLocationCoordinate2D(latitude: 43.6426, longitude: 79.3871), title: "Canada's Largest Building", subtitle: "Canada's Largest Building")
//        mapMKView.addAnnotation(cnTower)
        let toronto = Landmark(title: "CN Tower", coordinate: CLLocationCoordinate2D(latitude: 43.64251, longitude: -79.387038), info: "True of False: The CN Tower is over 500 metres tall")
        
        let casaloma = Landmark(title: "Casa Loma", coordinate: CLLocationCoordinate2D(latitude: 43.678, longitude: -79.41), info: " True or False: Casa Loma  was built from the period 1911 to 1914")
        self.mapMKView.addAnnotations([toronto, casaloma])
        
        //From Hack night - Jessica and I created a timer that allowed us to load 2 different locations to see it change:
        //self.locationManager.distanceFilter = 1.0
        // let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "changeLocation", userInfo: nil, repeats: false)
        //mapSetUP()
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView {
        // Step 1
        let identifier = "Landmarks"
        var annotationView:MKAnnotationView
        
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) where annotation.isKindOfClass(Landmark.self) {
            dequeuedAnnotationView.annotation = annotation
            annotationView = dequeuedAnnotationView
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
            
            let btn = UIButton(type: .DetailDisclosure)
            annotationView.rightCalloutAccessoryView = btn
        }
        return annotationView
    }
    
        
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let capital = view.annotation as! Landmark
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    func changeLocation() {
//        var centre:CLLocationCoordinate2D = CLLocationCoordinate2DMake(44.64251, -79.387038)
//        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.2, 0.2)
//        var regionToDisplay = MKCoordinateRegionMake(centre, span)
//        self.mapMKView.setRegion(regionToDisplay, animated: true)
//
//    }
    
//    func mapSetUP() {
//        // Request for a user's authorization for location services
//        locationManager.requestWhenInUseAuthorization()
//        let status = CLLocationManager.authorizationStatus()
//        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
//            self.mapMKView.showsUserLocation = true
//        }
//        self.locationManager.requestWhenInUseAuthorization()
//        
//        var centre:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.64251, -79.387038)
//        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.2, 0.2)
//        var regionToDisplay = MKCoordinateRegionMake(centre, span)
//        self.mapMKView.setRegion(regionToDisplay, animated: true)
    
//        //geocoding an address
//        geoCoder.geocodeAddressString(triviaData[0].address) { (placemarks, error ) -> Void in
//            guard let placemarks = placemarks else {return}
//            self.currentPlacemark = placemarks[0]
//            
//        }

   // }
    
    
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let defaultLocation:CLLocation = CLLocation(latitude: 43.64251, longitude: -79.387038)
//        CLGeocoder().reverseGeocodeLocation(manager.location ?? defaultLocation, completionHandler: { (placemarks, error) -> Void in
//            //
//            if error != nil {
//                print("Error" + error!.localizedDescription)
//                return
//            }
//            guard let placemarks = placemarks else {return}
//            if placemarks.count > 0 {
//                let pm = placemarks[0] 
//                self.displayLocationInfo(pm)
//            }
//        })
//    }
//    
//    func displayLocationInfo(placemark: CLPlacemark) {
//        self.locationManager.stopUpdatingLocation()
//        print(placemark.locality)
//        print(placemark.postalCode)
//        print(placemark.administrativeArea)
//        print(placemark.country)
//
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
