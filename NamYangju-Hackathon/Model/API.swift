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


var items:[Post] = []


class API {
    static func setItems(posts:[Post]) {
        items = posts
    }
    
    static func thumb_up(boardid:String,memberid:String,completion:@escaping (Bool)->Void) {
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "505443c9-48fb-4d54-bfd4-05d61f5af62d"
        ]
        let parameters = [
            "boardid": boardid,
            "memberid": memberid
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://13.209.180.114:8081/boards/good")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                completion(true)
            }
        })
        
        dataTask.resume()
    }
    
    
    static func fetch_posts(id:Int, completion:@escaping([Post])->Void) {
        let baseUrl = "http://13.209.180.114:8081/boards/search?id=\(id)"
        
        Alamofire.request(baseUrl).responseJSON { (response) in
            if response.result.isSuccess {
                let res = response.result.value
                
                let json = JSON(res)
                completion(Post.transform_post(json: json))
            } else {
                print(response.error)
            }
        }
    }
    
    static func fetch_posts(title:String, completion:@escaping([Post])->Void) {
        let baseUrl = "http://13.209.180.114:8081/boards/search?title="
        
        let encodeQuery = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let requestUrl = baseUrl +  encodeQuery!
        
        Alamofire.request(requestUrl).responseJSON { (response) in
            if response.result.isSuccess {
                let res = response.result.value
                
                let json = JSON(res)
                print(json)
                completion(Post.transform_post(json: json))
            } else {
                print(response.error)
            }
        }
    }
    
    static func fetch_posts(completion:@escaping([Post])->Void) {
        Alamofire.request("http://13.209.180.114:8081/boards?sort=good,desc").responseJSON { (response) in
            if response.result.isSuccess {
                let res = response.result.value
                let json = JSON(res)
                completion(Post.transform_post(json: json))
            } else {
                print(response.error)
            }
        }
    }
    
    //Alamofire로 body에 json 전송이 안돼서 postman 코드로 대체
    
    static func login(id:String,password:String,completion:@escaping(Bool)->Void) {
        
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "2bbf1fe1-32d4-4cd6-8c0b-7816fa4a8388"
        ]
        let parameters = [
            "id": id,
            "password": password
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://13.209.180.114:8081/Login.do")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                
                let data = JSON(data)
                
                if !data["access_token"].stringValue.isEmpty {
                    completion(true)
                } else {
                    completion(false)
                }
                
            }
        })
        
        dataTask.resume()
    }
    
    static func send(id:String,password:String,email:String,username:String,completion: @escaping (User)->Void) {
        
        
        
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "3afe5d00-3e75-4dc4-9053-412cde351bb4"
        ]
        let parameters = [
            "id": id,
            "password": password,
            "email": email,
            "username": username
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://13.209.180.114:8081/members")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                let data = JSON(data)
                completion(User.userTransform(temp: data, id: id))
            }
        })
        
        dataTask.resume()
    }
    
    
    static func upload_post(title:String,content:String,completion:@escaping(Bool)->Void) {
        
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "32326dff-050b-4592-a110-a0b6b233a8bf"
        ]
        let parameters = [
            "memberid": currentUser?.id,
            "title": title,
            "content": content,
            "good": 0
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://13.209.180.114:8081/boards")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                completion(true)
            }
        })
        
        dataTask.resume()
    }
}





