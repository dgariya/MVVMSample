//
//  Users.swift
//  MVVMSample
//
//  Created by Singh, Dev on 2020/02/16.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import Foundation

struct User: Codable {
    var userID: Int
    var name: String
    var userName: String
    var email: String
    var address: Address
    var phone: String
    
    enum CodingKeys: String, CodingKey {
            case userID = "id"
            case name = "name"
            case userName = "username"
            case email = "email"
            case address = "address"
            case phone = "phone"
    }
}

struct Address: Codable {
    var street: String
    var city: String
    var zipCode: String
    
    enum CodingKeys: String, CodingKey {
            case street = "street"
            case city = "city"
            case zipCode = "zipcode"
    }
}
