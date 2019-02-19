//
//  CompanyModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/6/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class CompanyModel : NSObject {
    
    var ma_dvcs : String = ""
    var ten_dvcs: String = ""
    var ten_dvcs2: String = ""
    
    
    init(dict: Any) {
        if let data = dict as? [String: Any] {
            ma_dvcs = data["ma_dvcs"] as? String ?? ""
            ten_dvcs = data["ten_dvcs"] as? String ?? ""
            ten_dvcs2 = data["ten_dvcs"] as? String ?? ""
        }
    }
}

class CompanyModelRp : NSObject {
    var data : Array<CompanyModel> = Array();
    var error : String = ""
    
    
    
    init(dict: Any) {
        if let dataResult = dict as? [String: Any] {
            data = (dataResult["data"] as? Array<CompanyModel> ?? nil)!
            error = dataResult["error"] as? String ?? ""
        }
    }
}
