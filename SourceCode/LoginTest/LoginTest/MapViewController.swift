//
//  MapViewController.swift
//  LoginTest
//
//  Created by SIMA on 2017. 11. 6..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {


    @IBOutlet var googleMapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 50, longitude: 50, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 50, longitude: 50)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}


//import UIKit
//import GoogleMaps
//
//class MapViewController: UIViewController {
//
//    // You don't need to modify the default init(nibName:bundle:) method.
//
//    override func loadView() {
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        let camera = GMSCameraPosition.camera(withLatitude: 37.516194, longitude: 37.516178, zoom: 12.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        view = mapView
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 37.516194, longitude: 37.516178)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//    }
//}

