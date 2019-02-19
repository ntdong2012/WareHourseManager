//
//  BarcodeModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/14/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class BarcodeModel: NSObject {
    
    var qr_id : Int64 = 0
    var ma_dvcs : String = ""
    var ma_bp : String = ""
    var ma_kho : String = ""
    var ma_vv : String = ""
    var ma_sp : String = ""
    var ma_nvl : String = ""
    var ma_lo : String = ""
    var ngay_lo : String = ""
    var sl_qc : Int64 = 0
    var maOnvl : String = ""
    
    override init() {
        
    }
    
    init(dict: Any) {
        if let data = dict as? [String: Any] {
            qr_id = data["qr_id"] as? Int64 ?? 0
            ma_dvcs = data["ma_dvcs"] as? String ?? ""
            ma_bp = data["ma_bp"] as? String ?? ""
            ma_kho = data["ma_kho"] as? String ?? ""
            
            ma_vv = data["ma_vv"] as? String ?? ""
            ma_sp = data["ma_sp"] as? String ?? ""
            ma_nvl = data["ma_nvl"] as? String ?? ""
            
            ma_lo = data["ma_lo"] as? String ?? ""
            ngay_lo = data["ngay_lo"] as? String ?? ""
            sl_qc = data["sl_qc"] as? Int64 ?? 0
            maOnvl = data["maOnvl"] as? String ?? ""
        }
    }
}
