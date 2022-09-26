//
//  ViewController.swift
//  prince
//
//  Created by Ram Prasad on 7/20/22.
//
import CoreLocation
import MapKit
import UIKit
import EventKit
import EventKitUI

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var mapView: MKMapView!
     
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 30.510799 , longitude: -97.667851)
        annotation.title = "Round Rock Area Serving Center"
        annotation.subtitle = "1099 E. Main Street, Round rock"
        mapView.addAnnotation(annotation)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest // battery
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    func render(_ location: CLLocation) {
        
    let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                            longitude: location.coordinate.longitude)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    let region = MKCoordinateRegion(center: coordinate,
                                    span: span)
    
    mapView.setRegion(region,
                      animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
    }

}

