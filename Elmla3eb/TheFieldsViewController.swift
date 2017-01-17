//
//  TheFieldsViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 16/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit
import MapKit
class TheFieldsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var addFieldBtn: UIButton!
    @IBOutlet weak var moreSpecialFieldBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapViewContainer: UIView!
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    let locationManager = CLLocationManager()
    
    var maphasCenteredOnce = false
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        mapView.delegate = self
        self.setLocation()
        revealMenu()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TheFieldTableViewCell
        
        return cell
    }
//    var lastKnowContentOfsset = CGFloat()

    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let contentOffset = scrollView.contentOffset.y
//            if (contentOffset > self.lastKnowContentOfsset) {
//                print("scrolling Down")
//                print("dragging Up")
//                self.mapViewContainer.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width , height: 0)
//            } else {
//                print("scrolling Up")
//                print("dragging Down")
//                self.mapViewContainer.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height * 0.43)
//            }
//        
//    }
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//           self.lastKnowContentOfsset = scrollView.contentOffset.y
//            print("lastKnowContentOfsset: ", scrollView.contentOffset.y)
//    
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
