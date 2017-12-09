//
//  LoginViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.setTitleColor(.white, for: .normal)
        btnLogin.backgroundColor = UIColor(red: 0/255, green: 84/255, blue: 114/255, alpha: 1.0)
        btnLogin.layer.cornerRadius = btnLogin.layer.frame.height / 2
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        print("btnLogin: ainda sem funcao")
    }
}
