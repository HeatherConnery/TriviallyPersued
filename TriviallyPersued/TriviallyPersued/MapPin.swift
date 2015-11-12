//
//  MapPin.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-12.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit
import MapKit

class MapPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title:String?
    var subtitle:String?
    
    init(coordinate:CLLocationCoordinate2D, title:String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
