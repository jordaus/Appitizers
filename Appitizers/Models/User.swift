//
//  User.swift
//  Appitizers
//
//  Created by Jordan Austin on 2/25/26.
//

import Foundation

struct User: Codable {
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var birthday : Date = Date()
    var extraNapkins : Bool = false
    var frequentRefills : Bool = false
}
