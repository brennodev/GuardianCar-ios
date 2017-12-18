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

class MapaViewController: BaseViewController  { //}, CLLocationManagerDelegate, MKMapViewDelegate {
    
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

//
//    required init?(coder aDecoder: NSCoder) {
//        self.loadDada(completionHandler: <#T##(Bool, ModelMap) -> ()#>)
//    }
    override func viewDidLoad() {
        
        loadDada { (error, _model) in
            
            let newDate = _model.time.replacingOccurrences(of: "-", with: "/")
            self.lbDate.text = "Ultima Atualização " + newDate + " | " + _model.placa
            self.lbTitulo1.text = "Combustível"
            self.lbTitulo2.text = "Bateria"
            self.lbTitulo3.text = "Perfil"
            
            self.lbT3Nome.text = _model.fullname
            self.lbT3Carro.text = _model.fabricante + " " + _model.modelo
            self.lbT3Placa.text = _model.placa
            
            let location = CLLocationCoordinate2D(latitude: Double(_model.latitude)!, longitude: Double(_model.longitude)!)
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            self.mapView.setRegion(region, animated: true)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = location
        
            dropPin.title = _model.placa
            dropPin.subtitle = _model.modelo

            self.mapView.addAnnotation(dropPin)
        }
        super.viewDidLoad()
        self.addSlideMenuButton()
    
        formatter.dateFormat = "dd/MM/yyyy"

        self.mapView.showsUserLocation = true
        
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
