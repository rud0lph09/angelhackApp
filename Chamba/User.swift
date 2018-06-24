//
//  User.swift
//  Chamba
//
//  Created by Rodolfo Castillo Vidrio on 24/06/18.
//  Copyright © 2018 Rodolfo Castillo Vidrio. All rights reserved.
//

import Foundation


class User {
    var name: String!
    var lastname: String!
    var secondLastName: String?
    var userEmail: String!
    var photoUrl: String!
    var gender: String!
    var telephone: String!
    
    init(withName name: String, lastName: String, secondLastName: String,email: String, tel: String, photoUrl: String, andGender gender: String) {
        self.name = name
        self.lastname = lastName
        self.secondLastName = secondLastName
        self.userEmail = email
        self.photoUrl = photoUrl
        self.gender = gender
        self.telephone = tel
    }
    
    
}
