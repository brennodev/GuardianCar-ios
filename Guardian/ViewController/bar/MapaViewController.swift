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
import Alamofire
import SwiftyJSON

class MapaViewController: BaseViewController, MKMapViewDelegate  { //}, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var vwMap1: UIView!
    @IBOutlet weak var vwMap2: UIView!
    @IBOutlet weak var vwMap3: UIView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lbTitulo1: UILabel!
    @IBOutlet weak var lbTitulo2: UILabel!
    @IBOutlet weak var lbTitulo3: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    @IBOutlet weak var lbT3Nome: UILabel!
    @IBOutlet weak var lbT3Carro: UILabel!
    @IBOutlet weak var lbT3Placa: UILabel!
    
    let date = Date()
    let formatter = DateFormatter()

    var point1 = MKPointAnnotation()
    var point2 = MKPointAnnotation()
    var point3 = MKPointAnnotation()
    var myRoute : MKRoute?
    
    override func viewDidLoad() {
        
        self.mapView.delegate = self
        
        
        loadDada { (error, _model) in
            
            let newDate = _model.time.replacingOccurrences(of: "-", with: "/")
            self.lbDate.text = "Ultima Atualização " + newDate + " | " + _model.placa
            self.lbTitulo1.text = "Combustível"
            self.lbTitulo2.text = "Bateria"
            self.lbTitulo3.text = "Perfil"
            
            self.lbT3Nome.text = _model.fullname
            self.lbT3Carro.text = _model.fabricante + " " + _model.modelo
            self.lbT3Placa.text = _model.placa
            
            self.point1.coordinate = CLLocationCoordinate2DMake(Double(_model.latitude)!, Double(_model.longitude)!)
            self.point1.title = "Final"
            self.point1.subtitle = "Taiwan"
            self.mapView.addAnnotation(self.point1)
            
            self.point2.coordinate = CLLocationCoordinate2DMake(-3.1269919, -60.0155599)
            self.point2.title = "Inicial"
            self.point2.subtitle = "Taiwan"
            self.mapView.addAnnotation(self.point2)
            self.mapView.centerCoordinate = self.point2.coordinate
            
            self.point3.coordinate = CLLocationCoordinate2DMake(-3.0299567,-59.9812923)
            self.point3.title = "Inicial"
            self.point3.subtitle = "Taiwan"
            self.mapView.addAnnotation(self.point3)
            self.mapView.centerCoordinate = self.point2.coordinate
            
            //Span of the map
            self.mapView.setRegion(MKCoordinateRegionMake(self.point2.coordinate, MKCoordinateSpanMake(0.1,0.1)), animated: true)
            
            let directionsRequest = MKDirectionsRequest()
            
            let mark1 = MKPlacemark(coordinate: CLLocationCoordinate2DMake(self.point1.coordinate.latitude, self.point1.coordinate.longitude), addressDictionary: nil)
            let mark2 = MKPlacemark(coordinate: CLLocationCoordinate2DMake(self.point2.coordinate.latitude, self.point2.coordinate.longitude), addressDictionary: nil)
            
            let mark3 = MKPlacemark(coordinate: CLLocationCoordinate2DMake(self.point3.coordinate.latitude, self.point3.coordinate.longitude), addressDictionary: nil)
            
            directionsRequest.source = MKMapItem(placemark: mark1)
            directionsRequest.destination = MKMapItem(placemark: mark2)
            

            directionsRequest.transportType = MKDirectionsTransportType.automobile
            
            let directions = MKDirections(request: directionsRequest)
            
            directions.calculate(completionHandler: { (response, error) in
                if error == nil {
                    self.myRoute = response?.routes[0]
                    self.mapView.add((self.myRoute?.polyline)!)
                }
            })
            
//            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
//            self.mapView.setRegion(region, animated: true)
//            let dropPin = MKPointAnnotation()
//            dropPin.coordinate = location
//
//            dropPin.title = _model.placa
//            dropPin.subtitle = _model.modelo
//
//            self.mapView.addAnnotation(dropPin)
        }
        
 
        
        super.viewDidLoad()
        self.addSlideMenuButton()
    
        formatter.dateFormat = "dd/MM/yyyy"

//        self.mapView.showsUserLocation = true
        
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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let myLineRenderer = MKPolylineRenderer(polyline: (myRoute?.polyline)!)
        myLineRenderer.strokeColor = UIColor.red
        myLineRenderer.lineWidth = 3
        return myLineRenderer
    }
    
    func loadDada(completionHandler: @escaping (_ result: Bool, _ model: ModelMap) -> ()) {

        let headers: HTTPHeaders = [
            "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRlbW9AZHJpdmVvbmF1dG8uY29tIiwicGFzc3dvcmQiOiIxMjM0NTYifQ.KiivsX8KJZuubpBTglauUM9tanlMje3Kd6yl-mK0u5Q",
        ]
        
        Alamofire.request(DRIVEON_MAPA, headers: headers)
            .responseJSON { responseData in
                
                if ((responseData.result.value != nil)) {
                    let post = JSON(responseData.result.value!)
                    var segurado = post["segurado"]
                    print(segurado)
                    let carro = segurado["carro"]
                    //print(carro)
                    let location = carro["location"]
                    
                    let _model = ModelMap(fullname: segurado["fullname"].string!, pontuacao: segurado["pontuacao"].string!, placa: carro["placa"].stringValue, chassi: carro["chassi"].stringValue, modelo: carro["modelo"].stringValue, fabricante: carro["fabricante"].stringValue, device: carro["device"].stringValue, anofabricacao: carro["anofabricacao"].stringValue, revisao: carro["revisao"].stringValue, cor: carro["cor"].stringValue, motor: carro["motor"].stringValue, latitude: location["latitude"].stringValue, longitude: location["longitude"].stringValue, time: carro["time"].stringValue)

                    
                    //retornar todo obj
                    completionHandler(true, _model)
                }
        }
    }
}

class ModelMap: NSObject {
    var fullname: String = ""
    var pontuacao: String = ""
    var placa: String = ""
    var chassi: String = ""
    var modelo: String = ""
    var fabricante: String = ""
    var device: String = ""
    var anofabricacao: String = ""
    var revisao: String = ""
    var cor: String = ""
    var motor: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var time: String = ""
    
    init(fullname: String, pontuacao: String, placa: String, chassi: String, modelo: String, fabricante: String, device: String, anofabricacao: String,
         revisao: String, cor: String, motor: String, latitude: String, longitude: String, time: String) {
        self.fullname = fullname
        self.pontuacao = pontuacao
        self.placa = placa
        self.chassi = chassi
        self.modelo = modelo
        self.fabricante = fabricante
        self.device = device
        self.anofabricacao = anofabricacao
        self.revisao = revisao
        self.cor = cor
        self.motor = motor
        self.latitude = latitude
        self.longitude = longitude
        self.time = time
    }

}
