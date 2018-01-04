//
//  User.swift
//  Guardian
//
//  Created by Brenno Hayden on 04/01/2018.
//  Copyright © 2018 Brenno Hayden. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: NSObject {
    
    var id: String!
    var fullname: String!
    var email: String!
    var hashpassword: String!
    var updated: String!
    var created: String!
    var pontuacao: String!
    var seguradora: String!
    var avatar: String!
    
    init(json: JSON) {
        
        let id = json["_id"].stringValue
        let fullname = json["fullname"].stringValue
        let email = json["email"].stringValue
        let hashpassword = json["hashpassword"].stringValue
        let updated = json["updated"].stringValue
        let created = json["created"].stringValue
        let pontuacao = json["pontuacao"].stringValue
        let seguradora = json["seguradora"].stringValue
        let avatar = json["avatar"].stringValue
        
        self.id = id
        self.fullname = fullname
        self.email = email
        self.hashpassword = hashpassword
        self.updated = updated
        self.created = created
        self.pontuacao = pontuacao
        self.seguradora = seguradora
        self.avatar = avatar
    }
    
    
    init(id: String, fullname: String, email: String, hashpassword: String,
         updated: String, created: String, pontuacao: String, seguradora: String, avatar: String) {
        self.id = id
        self.fullname = fullname
        self.email = email
        self.hashpassword = hashpassword
        self.updated = updated
        self.created = created
        self.pontuacao = pontuacao
        self.seguradora = seguradora
        self.avatar = avatar
    }
    
}

