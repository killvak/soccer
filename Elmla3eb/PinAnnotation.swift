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

    var fieldID  : Int
    init(title:String,info:String,Coord:CLLocationCoordinate2D , fieldId : Int) {
        
        self.title = title
        self.subtitle = info
        self.coordinate = Coord
        self.fieldID = fieldId
    }
}
