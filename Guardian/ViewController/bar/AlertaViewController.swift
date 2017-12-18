//
//  AlertaViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class AlertaViewController: BaseViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lbDateEPlaca: UILabel!
    
    let date = Date()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSlideMenuButton()
        
        formatter.dateFormat = "dd/MM/yyyy"
        
        lbDateEPlaca.text = formatter.string(from: date) + " | JXP 0102"
        
    }
}
