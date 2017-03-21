//
//  ViewController.swift
//  MobileMapper
//
//  Created by student3 on 3/20/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let herseyAnnotation = MKPointAnnotation()
    let address = "Eifel Tower"
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longitude: Double = 42.102332924
        let latitude: Double = -87.955661244
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        herseyAnnotation.coordinate = coordinate
        herseyAnnotation.title = "John Hersey High School"
        mapView.addAnnotation(herseyAnnotation)
        
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            for place in placemarks!
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (place.location?.coordinate)!
                annotation.title = place.name
                self.mapView.addAnnotation(annotation)
            }
            
        }
        
    }


}

