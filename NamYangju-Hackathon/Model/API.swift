//
//  API.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    static func send(id:String,password:String,email:String,username:String,completion: @escaping (User)->Void) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let parameters = [
            "id": id,
            "password": password,
            "email": email,
            "username": username
        ]
        Alamofire.request("http://10.0.100.164:8081/members", method: .post, parameters: parameters, encoding: .JSON, headers: headers).responseJSON { (response) in
            
            print(response)
            
            //completion(User.userTransform(temp: json, id: id))
        }
    }
}





