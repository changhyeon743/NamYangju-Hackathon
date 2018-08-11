//
//  Post.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 12..
//  Copyright © 2018년 이창현. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct Post {
    var id:String
    var memberid:String
    var title:String
    var pictureurl:String
    var content:String
    var good:Int
}


extension Post {
    static func transform_post(json:JSON) -> [Post] {
        let post = json.arrayValue
        
        
        
        //아름다운 코드 ㅎㅎ
        let posts:[Post] = post.map{
            Post(id: $0["id"].stringValue,
                 memberid: $0["memberid"].stringValue ,
                 title: $0["title"].stringValue,
                 pictureurl: $0["pictureurl"].stringValue,
                 content: $0["content"].stringValue,
                 good: $0["good"].intValue)
        }
        
        return posts
        
    }
}
