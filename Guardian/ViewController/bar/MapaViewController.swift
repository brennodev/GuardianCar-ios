//
//  MapaViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class MapaViewController: UIViewController {
    
    @IBOutlet weak var vwMap1: UIView!
    @IBOutlet weak var vwMap2: UIView!
    @IBOutlet weak var vwMap3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
