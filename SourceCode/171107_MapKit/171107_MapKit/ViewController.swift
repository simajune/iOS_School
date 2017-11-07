//
//  ViewController.swift
//  171107_MapKit
//
//  Created by SIMA on 2017. 11. 7..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    

    let manager = CLLocationManager()

    @IBOutlet var mapView: MKMapView!
    var annotation: MKAnnotation?
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(coordinateRegion, animated: true)
        
        mapView.delegate = self
        let customPin = CustomAnnotation(title: "Sample", coordinate: location.coordinate)
        mapView.addAnnotation(customPin)
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? CustomAnnotation {
            let identity = "pin"
            var pinView: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            } else {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
                pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            return pinView
        }
        return nil
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        ///callout Action
    }
    
}

class CustomAnnotation:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let nowLocation = locations.last
        {
            manager.startUpdatingLocation()
        }
    }

}


