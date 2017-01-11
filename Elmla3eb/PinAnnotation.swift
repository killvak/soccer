//
//  PinAnnotation.swift
//  Elmla3eb
//
//  Created by Killvak on 11/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import MapKit

class PinAnnotation : NSObject , MKAnnotation {
    
    var title : String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(title:String,info:String,Coord:CLLocationCoordinate2D) {
        
        self.title = title
        self.subtitle = info
        self.coordinate = Coord
    }
}
