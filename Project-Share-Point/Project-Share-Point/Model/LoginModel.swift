//
//  LoginModel.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 8.06.2022.
//

import Foundation
import UIKit

struct LoginModel:Encodable {
    let emailAddress : String
    let password : String
}

struct loginResponseModel {
    let name: String
    let email : String
}
