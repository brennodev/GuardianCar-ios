//
//  DashViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class DashViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var vwMap1: UIView!
    @IBOutlet weak var vwMap2: UIView!
    @IBOutlet weak var vwMap3: UIView!
    @IBOutlet weak var vwMap4: UIView!
    @IBOutlet weak var vwMap5: UIView!
    @IBOutlet weak var vwMap6: UIView!
    
    @IBOutlet weak var vwMap7: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSlideMenuButton()
        self.vwMap1.backgroundColor = .white
        self.vwMap2.backgroundColor = .white
        self.vwMap3.backgroundColor = .white
        self.vwMap4.backgroundColor = .white
        self.vwMap5.backgroundColor = .white
        self.vwMap6.backgroundColor = .white
        self.vwMap7.backgroundColor = .white
        
        self.vwMap1.layer.cornerRadius = 10
        self.vwMap2.layer.cornerRadius = 10
        self.vwMap3.layer.cornerRadius = 10
        self.vwMap4.layer.cornerRadius = 10
        self.vwMap5.layer.cornerRadius = 10
        self.vwMap6.layer.cornerRadius = 10
        self.vwMap7.layer.cornerRadius = 10
        
        self.vwMap1.layer.shadowColor = UIColor.black.cgColor
        self.vwMap1.layer.shadowOpacity = 0.8
        self.vwMap1.layer.shadowOffset = CGSize.zero
        self.vwMap2.layer.shadowColor = UIColor.black.cgColor
        self.vwMap2.layer.shadowOpacity = 0.8
        self.vwMap2.layer.shadowOffset = CGSize.zero
        self.vwMap3.layer.shadowColor = UIColor.black.cgColor
        self.vwMap3.layer.shadowOpacity = 0.8
        self.vwMap3.layer.shadowOffset = CGSize.zero
        self.vwMap4.layer.shadowColor = UIColor.black.cgColor
        self.vwMap4.layer.shadowOpacity = 0.8
        self.vwMap4.layer.shadowOffset = CGSize.zero
        self.vwMap5.layer.shadowOpacity = 0.8
        self.vwMap5.layer.shadowOffset = CGSize.zero
        self.vwMap6.layer.shadowColor = UIColor.black.cgColor
        self.vwMap6.layer.shadowOpacity = 0.8
        self.vwMap6.layer.shadowOffset = CGSize.zero
        self.vwMap7.layer.shadowColor = UIColor.black.cgColor
        self.vwMap7.layer.shadowOpacity = 0.8
        self.vwMap7.layer.shadowOffset = CGSize.zero
    }
    @IBAction func btnInfo(_ sender: Any) {
        print("btnInfo")
    }
}
