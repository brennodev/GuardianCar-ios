//
//  DatabaseManagement.swift
//  Guardian
//
//  Created by Brenno Hayden on 04/01/2018.
//  Copyright © 2018 Brenno Hayden. All rights reserved.
//

import UIKit
import SQLite

class DatabaseManagement {
    
    static let shared: DatabaseManagement = DatabaseManagement()
    private let db: Connection?

    private let tbUser = Table("user")
    
    private let id = Expression<String>("id")
    private let fullname = Expression<String>("fullname")
    private let email = Expression<String>("email")
    private let hashpassword = Expression<String>("hashpassword")
    private let updated = Expression<String>("updated")
    private let created = Expression<String>("created")
    private let pontuacao = Expression<String>("pontuacao")
    private let seguradora = Expression<String>("seguradora")
    private let avatar = Expression<String>("avatar")
    
    private init() {
        
        print("DatabaseManagement::")
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/guard.sqlite3")
            self.crateTableUser()
        }catch {
            db = nil
            print("unable to open datebase")
        }
    }
    
    func insertTableUser(user: User) {
        print("insertTableUser |||||||")
        print("id: ", user.id)
        print("full: ", user.fullname)
        print("email: ", user.email)
        print("hashpassword: ", user.hashpassword)
        print("updated: ", user.updated)
        print("created: ",user.created)
        print("pontuacao: ",user.pontuacao)
        print("seguradora: ",user.seguradora)
        print("avatar: ",user.avatar)
        
        let insertUser = tbUser.insert(
            id <- user.id,
            fullname <- user.fullname,
            email <- user.email,
            hashpassword <- user.hashpassword,
            updated <- user.updated,
            created <- user.created,
            pontuacao <- user.pontuacao,
            seguradora <- user.seguradora,
            avatar <- user.avatar)
        
        do {
            try db!.run(insertUser)
            print("Insert user")
        }catch {
            print(error)
        }
    }
    
    func listTableUser() -> User {
        print("listTableUser")

        var user1: User!
        do {
            let users = try db!.prepare(tbUser)

            print("count ", users.underestimatedCount)
            for user in users {
                print("User: id \(user[id]), fullname \(user[fullname]), email \(user[email]), hashpassword \(user[hashpassword]), seguradora \(user[seguradora]) ")

                let _user = User(id: user[id], fullname: user[fullname], email: user[email], hashpassword: user[hashpassword], updated: user[updated], created: user[created], pontuacao: user[pontuacao], seguradora: user[seguradora], avatar: user[avatar])

                user1 = _user
                //return _user
            }
        }catch{
            print(error)
        }
        
        return user1
    }
    
    func deleteTableUser(user: User) {
        let user = tbUser.filter(id == user.id)
        let deleteUser = user.delete()
        
        do {
            try db!.run(deleteUser)
            print("Delete User")
        }catch {
            print(error)
        }
    }
    
    func crateTableUser() {
        let createTable = tbUser.create { (table) in
            table.column(id, primaryKey: true)
            table.column(fullname)
            table.column(email)
            table.column(hashpassword)
            table.column(updated)
            table.column(created)
            table.column(pontuacao)
            table.column(seguradora)
            table.column(avatar)
        }
        do {
            try db!.run(createTable)
            print("Created Database user")
        }catch {
            print("Error Database user: ", error)
        }
    }
    
    func deleteTableUser() {
        let deleteTable = tbUser.delete()
        
        do {
            try db!.run(deleteTable)
            print("Created Database user")
        }catch {
            print("Error Database user: ", error)
        }
    }
}
