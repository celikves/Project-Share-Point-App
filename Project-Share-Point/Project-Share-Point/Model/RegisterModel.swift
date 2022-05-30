//
//  RegisterModel.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 30.05.2022.
//

import Foundation

struct RegisterModel : Encodable {
    let username : String
    let password : String
    let firstName : String
    let lastName : String
    let emailAddress : String
}
