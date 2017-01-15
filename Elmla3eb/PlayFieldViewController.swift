//
//  PlayFieldViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 10/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class PlayFieldViewController: UIViewController , MKMapViewDelegate  {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showFieldsImage: RoundRectView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self


        
        collectionView.delegate = self
        collectionView.dataSource = self 
        let location = CLLocationCoordinate2DMake(24.774265, 46.738586)
        let span  = MKCoordinateSpanMake(1,1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let reyad =  PinAnnotation(title: "ryad", info: "PlayGround 1", Coord: location,fieldId : 1 )

        mapView.addAnnotation(reyad)
        }
       // Then in CLLocationManagerDelegate method you can get user's current location coord


    @IBAction func BookNowBtnAct(_ sender: UIButton) {
    }
    
    @IBAction func showFieldsImagesBtnAct(_ sender: UIButton) {
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
