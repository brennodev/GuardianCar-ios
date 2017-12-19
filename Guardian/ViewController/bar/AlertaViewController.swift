//
//  AlertaViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlertaViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lbDateEPlaca: UILabel!
    
    let date = Date()
    let formatter = DateFormatter()
    
    private var alertList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        formatter.dateFormat = "dd/MM/yyyy"
        lbDateEPlaca.text = formatter.string(from: date) + " | JXP 0102"

        self.loadDada { (isok, list) in
            
            self.alertList.removeAll()
            if list.count > 0 {
                self.alertList = list
                self.tableview.reloadData()
            }
        }
        
        if(alertList.count == 0){
            self.tableview.tableFooterView = UIView()
        }
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNotificacao") as! NotificacaoTableViewCell
        let text = self.alertList[indexPath.row]
        cell.lbTitulo.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func loadDada(completionHandler: @escaping (_ result: Bool, _ alertList: [String] ) -> ()) {
   
        let headers: HTTPHeaders = [
            "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRlbW9AZHJpdmVvbmF1dG8uY29tIiwicGFzc3dvcmQiOiIxMjM0NTYifQ.KiivsX8KJZuubpBTglauUM9tanlMje3Kd6yl-mK0u5Q",
            ]
        Alamofire.request(DRIVEON_ALERTA, headers: headers)
            .responseJSON { responseData in
                
                if ((responseData.result.value != nil)) {
                    
                    let post = JSON(responseData.result.value!)

                    if let alertas = post["alertas"].array {
                        
                         for alerta in alertas {
                            
                            let titulo = alerta["message"].stringValue
                            self.alertList.append(titulo)
                            self.tableview.reloadData()
                         }
                        self.tableview.reloadData()
                        completionHandler(true, self.alertList)
                    }
                }
        }
    }
}

