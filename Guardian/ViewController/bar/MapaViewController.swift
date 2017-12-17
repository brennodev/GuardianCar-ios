//
//  MapaViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: BaseViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var vwMap1: UIView!
    @IBOutlet weak var vwMap2: UIView!
    @IBOutlet weak var vwMap3: UIView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lbDate: UILabel!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSlideMenuButton()
    
        self.manager = CLLocationManager()
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        
        self.mapView.mapType = MKMapType.standard
        
        self.vwMap1.layer.cornerRadius = 10
        self.vwMap2.layer.cornerRadius = 10
        self.vwMap3.layer.cornerRadius = 10
        
        self.vwMap1.layer.shadowColor = UIColor.black.cgColor
        self.vwMap1.layer.shadowOpacity = 0.8
        self.vwMap1.layer.shadowOffset = CGSize.zero
        
        self.vwMap2.layer.shadowColor = UIColor.black.cgColor
        self.vwMap2.layer.shadowOpacity = 0.8
        self.vwMap2.layer.shadowOffset = CGSize.zero
        
        self.vwMap3.layer.shadowColor = UIColor.black.cgColor
        self.vwMap3.layer.shadowOpacity = 0.8
        self.vwMap3.layer.shadowOffset = CGSize.zero
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.05
        
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: false)
        
         let pin = MKPointAnnotation()
         pin.coordinate.latitude = userLocation.coordinate.latitude
         pin.coordinate.longitude = userLocation.coordinate.longitude
         pin.title = "JXP 0102"
         mapView.addAnnotation(pin)
        
    }
}
