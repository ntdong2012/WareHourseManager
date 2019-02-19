//
//  DeptModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/12/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class DeptModel: NSObject {
    
    var ma_cd : String = ""
    var ten_cd: String = ""
    var ten_cd2: String = ""
    
    init(dict: Any) {
        if let data = dict as? [String: Any] {
            ma_cd = data["ma_cd"] as? String ?? ""
            ten_cd = data["ten_cd"] as? String ?? ""
            ten_cd2 = data["ten_cd2"] as? String ?? ""
        }
    }
}

class DeptModelRp : NSObject {
    var data : Array<DeptModel> = Array();
    var error : String = ""
    

    init(dict: Any) {
        if let dataResult = dict as? [String: Any] {
            data = (dataResult["data"] as? Array<DeptModel> ?? nil)!
            error = dataResult["error"] as? String ?? ""
        }
    }
}
