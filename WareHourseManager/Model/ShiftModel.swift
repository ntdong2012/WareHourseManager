//
//  ShiftModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/1/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class ShiftModel: NSObject {
    
    var ma_ca : String = ""
    var ten_ca: String = ""
    var ten_ca2: String = ""
    
    init(dict: Any) {
        if let data = dict as? [String: Any] {
            ma_ca = data["ma_ca"] as? String ?? ""
            ten_ca = data["ten_ca"] as? String ?? ""
            ten_ca2 = data["ten_ca2"] as? String ?? ""
        }
    }
}

class ShiftModelRp : NSObject {
    var data : Array<ShiftModel> = Array();
    var error : String = ""
    
    
    
    init(dict: Any) {
        if let dataResult = dict as? [String: Any] {
            data = (dataResult["data"] as? Array<ShiftModel> ?? nil)!
            error = dataResult["error"] as? String ?? ""
        }
    }
}

