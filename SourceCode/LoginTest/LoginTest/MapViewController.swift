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

    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CLLocationManager

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
                // 사용할때만 위치정보를 사용한다는 팝업이 발생
                locationManager.requestWhenInUseAuthorization()
        
                // 항상 위치정보를 사용한다는 판업이 발생
                locationManager.requestAlwaysAuthorization()
        
                locationManager.startUpdatingLocation()
        
                move(at: locationManager.location?.coordinate)
    }
    
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        print("move = \(coordinate)")
        
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
        mapView.camera = camera
        
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "My Position"
        marker.snippet = "Known"
        marker.map = mapView
    }
    
    override func loadView() {
        super.loadView()
        func move(at coordinate: CLLocationCoordinate2D?) {
            guard let coordinate = coordinate else {
                return
            }
            print("move = \(coordinate)")
    
            let latitude = coordinate.latitude
            let longitude = coordinate.longitude
    
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
            mapView.camera = camera
    
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.title = "Fast Campus"
            marker.snippet = "Coding"
            marker.map = mapView
        }
            
//        let camera = GMSCameraPosition.camera(withLatitude: 37.516113, longitude: 127.019880, zoom: 15.0)
//        //mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        mapView.camera = camera
//
//
//        marker.position = CLLocationCoordinate2D(latitude: 37.516113, longitude: 127.019880)
//        marker.appearAnimation = .pop
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//        mapView.reloadInputViews()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }

        move(at: firstLocation.coordinate)
    }
}



