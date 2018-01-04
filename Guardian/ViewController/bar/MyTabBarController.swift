//
//  MyTabBarController.swift
//  Guardian
//
//  Created by Brenno Hayden on 04/01/2018.
//  Copyright © 2018 Brenno Hayden. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MyTabBarController::viewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MyTabBarController::viewWillAppear")
        self.tabBarController?.selectedIndex = 2
    }
    
}
