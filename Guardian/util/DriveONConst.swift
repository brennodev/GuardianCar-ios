//
//  DriveONConst.swift
//  Guardian
//
//  Created by Brenno Hayden on 15/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import Foundation

                    
let DRIVEON_HOST = "http://ec2-54-85-165-146.compute-1.amazonaws.com:4885/api/"

//segurado
let DRIVEON_SEGURADO = DRIVEON_HOST + "segurado/"
let DRIVEON_SEGURADO_LOGIN = DRIVEON_SEGURADO + "login"
let DRIVEON_SEGURADO_FORGOT = DRIVEON_SEGURADO + "forgot"
let DRIVEON_SEGURADO_PERFIL = DRIVEON_SEGURADO + "me"

//sinistro
let DRIVEON_SINISTRO = DRIVEON_SEGURADO + "sinistro"

//alerta
let DRIVEON_ALERTA = DRIVEON_HOST + "alerta/me"

//mapa
let DRIVEON_MAPA = DRIVEON_HOST + "carro/me"



//USER DEFAULTS
let TOKEN = "token"
let USERID = "userID"
