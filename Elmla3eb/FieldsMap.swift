//
//  FieldsMap.swift
//  
//
//  Created by Killvak on 14/01/2017.
//
//

import UIKit
import MapKit
class FieldsMap: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate{

    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var maphasCenteredOnce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        
        
        let location = CLLocationCoordinate2DMake(24.774265, 46.738586)
        let span  = MKCoordinateSpanMake(1,1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let reyad =  PinAnnotation(title: "ryad", info: "PlayGround 1", Coord: location,fieldId : 1 )
    
        mapView.addAnnotation(reyad)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    

    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    func centerMapOnLocation(location:CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            if !maphasCenteredOnce {
                centerMapOnLocation(location: loc)
                maphasCenteredOnce = true
            }
        }
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView : MKAnnotationView?
        if annotation.isKind(of: MKUserLocation.self) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotationView?.image = UIImage(named: "pin")
        }else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: "ash")
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        if let annotationView = annotationView , let anno = annotation as? PinAnnotation{
            annotationView.canShowCallout = false 
            annotationView.image = UIImage(named: "pin")
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn.setImage(UIImage(named : "0"), for: UIControlState.normal)
            annotationView.rightCalloutAccessoryView = btn
        }
        return annotationView
    }
    
    
    func showFieldsOnMap(location : CLLocation) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
