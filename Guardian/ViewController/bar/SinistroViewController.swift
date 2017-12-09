//
//  SinistroViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class SinistroViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbTittulo: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    private var titulo = ["Assistência 24h", "Colisão", "Furto de Veículo", "Roubo de Veículo"]
    
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titulo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellsinistro") as! SinistroTableViewCell
        
        let text = titulo[indexPath.row]
        
        cell.cellView.layer.cornerRadius = 9
        cell.lbTitulo?.text = text
        cell.imgInfo.image = #imageLiteral(resourceName: "btnInfo")
        cell.imgTipo.image = #imageLiteral(resourceName: "siniassistencia")
        cell.imgForma.image = #imageLiteral(resourceName: "sinitelefone")
        

        
        return cell //4.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Hint", message: "You have selected row \(indexPath.row).", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    @IBAction func btnInfo(_ sender: Any) {
        print("btnInfo: ainda sem funcao")
    }
}
