//
//  UserModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/13/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    
    var user_id : Int32 = 0
    var user_name: String = ""
    var full_name: String = ""
    var full_name2: String = ""
    
    init(dict: Any) {
        if let data = dict as? [String: Any] {
            user_id = data["user_id"] as? Int32 ?? 0
            user_name = data["user_name"] as? String ?? ""
            full_name = data["full_name"] as? String ?? ""
            full_name2 = data["full_name2"] as? String ?? ""
        }
    }
}

class UserModelRp : NSObject {
    var data : Array<UserModel> = Array();
    var error : String = ""
    
    
    init(dict: Any) {
        if let dataResult = dict as? [String: Any] {
            data = (dataResult["data"] as? Array<UserModel> ?? nil)!
            error = dataResult["error"] as? String ?? ""
        }
    }
}
