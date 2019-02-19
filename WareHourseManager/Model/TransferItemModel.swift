//
//  TransferItemModel.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/18/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class TransferItemModel : NSObject {
    
    var so_ct : String = ""
    var ngay_ct : String = ""
    var tong_sl_nvl : Int64 = 0
    var ma_gd : String = ""
    var stt_rec : String = ""
    var ma_dvcs : String = ""
    var ma_ca : String = ""
    var ma_da : String = ""
    var ma_bp_giao : String = ""
    var ma_bp_nhan : String = ""
    var ma_px : String = ""
    var ma_cd : String = ""
    var ma_sp : String = ""
    var so_luong_sp : Int64 = 0
    var user_id0 : Int = 0
    var user_id2 : Int = 0
    var ma_kh : String  = ""
    var danh_sach_nvl:[TransferItemObj] = []
    
    override init() {
        
    }
    
}
