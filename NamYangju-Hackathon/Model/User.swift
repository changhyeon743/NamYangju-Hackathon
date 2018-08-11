//
//  User.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct User {
    var id:String
    var password:String
    var email:String
    var name:String
    
}

var currentUser:User?

extension User {
    static func userTransform(temp:JSON,id:String) -> User {
        let user = User(id: id, password: temp["password"].stringValue, email: temp["email"].stringValue, name: temp["username"].stringValue)
        
        return user
    }
}
