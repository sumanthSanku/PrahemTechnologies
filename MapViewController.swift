//
//  MapViewController.swift
//  System-Task
//
//  Created by apple on 6/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import GooglePlaces
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {

    @IBOutlet weak var Mapvieww: GMSMapView!
    
    var locationManager: CLLocationManager!
    var latitudeValue:Double!
    var longtitudeValue:Double!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Mapvieww.isMyLocationEnabled = true
        Mapvieww.settings.compassButton = true
        Mapvieww.settings.myLocationButton = true
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
       //MARK: - location delegate methods
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: self.latitudeValue, longitude: self.longtitudeValue)
                let location = CLLocation(latitude: self.latitudeValue, longitude: self.longtitudeValue)
                location.fetchCityAndCountry { city, country, error in
                    guard let city = city, let country = country,
                        error == nil
                        else
                    {
                        return }
                    marker.title = country
                    marker.snippet = city
                    marker.map = self.Mapvieww
                    
                }
            }
        }
        var location = locationManager.location?.coordinate
        print(location)
        cameraMoveToLocation(toLocation: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }

       func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
           if toLocation != nil {
               Mapvieww.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 5)
           }
       }
}


extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
