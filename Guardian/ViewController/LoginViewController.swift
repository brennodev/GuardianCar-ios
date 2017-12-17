//
//  LoginViewController.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.delegate = self
        tfSenha.delegate = self
        
        btnLogin.setTitleColor(.white, for: .normal)
        btnLogin.backgroundColor = UIColor(red: 0/255, green: 84/255, blue: 114/255, alpha: 1.0)
        btnLogin.layer.cornerRadius = btnLogin.layer.frame.height / 2
    }
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func forgotPress(_ sender: Any) {
        if let url = URL(string: DRIVEON_SEGURADO_FORGOT) {
            UIApplication.shared.open(url, options: [:])
        }
    }

    @IBAction func btnLogin(_ sender: Any) {
        
        if (tfEmail.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Ops", message: "Você esqueceu do email.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Voltar", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if (tfSenha.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Ops", message: "Você esqueceu da senha.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Voltar", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        starLoadAnimation()
        
        login(username: tfEmail.text!, password: tfSenha.text!) { (_result, _tokenOrMessage) in

            self.stopLoadAnimation()
            
            if _result {

                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let navigationController = storyBoard.instantiateViewController(withIdentifier: "tabBarMain") as! UITabBarController

                self.present(navigationController, animated: true, completion: nil)

            }else {
                let alertController = UIAlertController(title: "Ops", message: _tokenOrMessage, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Voltar", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func login (username : String, password : String, completionHandler: @escaping (_ result: Bool, _ token: String) -> ()) {
        
        let parameters = [
            "email": username,
            "password": password
        ]
        
        Alamofire.request(DRIVEON_SEGURADO_LOGIN, method: .post, parameters: parameters).responseJSON { responseData in
            
            if ((responseData.result.value != nil)) {
                let post = JSON(responseData.result.value!)
                
                if let key = post["token"].string {
                    completionHandler(true, key)
                    
                }else {
                    if let key = post["message"].string {
                        completionHandler(false, key)
                    }else {
                        completionHandler(false, "error nao conhecido")
                        print("error nao conhecido")
                    }
                }
            }
        }
    }
    
    func starLoadAnimation() {
        self.activityIndicator.center = self.view.center
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicator)
        
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopLoadAnimation() {
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
