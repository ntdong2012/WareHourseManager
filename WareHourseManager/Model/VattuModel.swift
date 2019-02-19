//
//  VattuModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/18/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation
class VattuModel : NSObject {
    
    var qrId : String = ""
    var ma_vt : String = ""
    var ten_vt : String = ""
    var ten_vt2 : String = ""
    var dvt : String = ""
    var ma_lo : String = ""
    var soluong: Int64 = 0
    var ma_loi_sx : String = ""
    var ma_nn_loi_sx : String = ""
    
    override init() {
        
    }
    
    init(dict: Any) {
        if let data = dict as? [String: Any] {
            ma_vt = data["ma_vt"] as? String ?? ""
            ten_vt = data["ten_vt"] as? String ?? ""
            ten_vt2 = data["ten_vt2"] as? String ?? ""
            dvt = data["dvt"] as? String ?? ""
        }
    }
}
