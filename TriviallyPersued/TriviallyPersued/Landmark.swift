//
//  Landmark.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-12.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit
import MapKit

class Landmark: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String?
    
    init(title:String,coordinate:CLLocationCoordinate2D,info:String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }

}
