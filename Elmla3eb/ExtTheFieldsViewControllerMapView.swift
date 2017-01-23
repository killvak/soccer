//
//  ExtTheFieldsViewControllerMapView.swift
//  Elmla3eb
//
//  Created by Killvak on 16/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation
import MapKit
extension TheFieldsViewController : MKMapViewDelegate , CLLocationManagerDelegate {
    
    
    func setLocation() {
        let location = CLLocationCoordinate2DMake(24.774265, 46.738586)
        let span  = MKCoordinateSpanMake(1,1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let reyad =  PinAnnotation(title: "ryad", info: "PlayGround 1", Coord: location,fieldId : 1 )
        
        mapView.addAnnotation(reyad)
        let location2 = CLLocationCoordinate2DMake(24.794265, 46.798586)
        let reyad2 =  PinAnnotation(title: "ryad Clup 2 ", info: "PlayGround 2", Coord: location2,fieldId : 2)
        let location3 = CLLocationCoordinate2DMake(24.894265, 46.898586)
        let reyad3 =  PinAnnotation(title: "ryad Clup 3", info: "PlayGround 3", Coord: location3,fieldId : 3)
        mapView.addAnnotation(reyad2)
        mapView.addAnnotation(reyad3)

    }
    
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            mapView.showsUserLocation = true
//        }
//    }
//    
//    func centerMapOnLocation(location:CLLocation) {
//        
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }
    
    
//    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//        if let loc = userLocation.location {
//            if !maphasCenteredOnce {
//                centerMapOnLocation(location: loc)
//                maphasCenteredOnce = true
//            }
//        }
//    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView : MKAnnotationView?
//        if annotation.isKind(of: MKUserLocation.self) {
////            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
////            annotationView?.image = UIImage(named: "")
//        }else {
//            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: "ash")
//            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            annotationView = av
//        }
        
        if let annotationView = annotationView , let anno = annotation as? PinAnnotation{
            annotationView.canShowCallout = false
            annotationView.image = UIImage(named: "Region Code_d32437_75")
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn.setImage(UIImage(named : "0"), for: UIControlState.normal)
            annotationView.rightCalloutAccessoryView = btn
        }
        return annotationView
    }
    
    
    func showFieldsOnMap(location : CLLocation) {
        
    }
    
}

