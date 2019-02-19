//
//  NetworkUtils.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/1/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation

class NetworkUtil: NSObject {
    static let shared = NetworkUtil()
    
    
    func login(username : String, password : String, ma_ca : String, ma_com : String,
        success: @escaping (String) -> Void,
        failure: @escaping () -> Void){
        var param = [String:Any]()
        param["username"] = username
        param["password"] = password
        param["ma_dvcs"] = ma_com
        param["ma_ca"] = ma_ca
        print(param)
        NetworkManager.shared.callingHttpPostMethodWithJson(params: param, apiname: "authentication", success: { (data) in
            print(data ?? "")
            if data == nil {
                success("")
            }else{
                if let found = (data as! [String:Any])["token"] as? String, found.count>0 {
                    success(found)
                }else{
                    success("")
                }
            }
            
            
        }, failure: { (error) in
            
        })
    }
    

    func getShifts(success: @escaping ([ShiftModel]) -> Void,
                   failure: @escaping (_ err: Error) -> Void) {
        var listShift:[ShiftModel] = []
        NetworkManager.shared.getItemsWithoutKey(urlFeature: "http://demo.ketoanmoka.com/api/Dmca", success: { (dataRs) in
            if let aData = (dataRs as! [String:Any])["data"] as? NSArray {
                for dict in aData {
                    let model = ShiftModel(dict: dict)
                    listShift.append(model)
                }
            }
            print(listShift[0].ten_ca)
            success(listShift)
        }, failure: { (error) in
            print(error.localizedDescription)
            
        })
    }
    
    
    func getDepts(apiKey: String, success: @escaping ([DeptModel]) -> Void,
                   failure: @escaping (_ err: Error) -> Void) {
        var listShift:[DeptModel] = []
        NetworkManager.shared.getItemsWithKey(urlFeature: "http://demo.ketoanmoka.com/api/Dmcd",apiKey: apiKey, success: { (dataRs) in
            if let aData = (dataRs as! [String:Any])["data"] as? NSArray {
                for dict in aData {
                    let model = DeptModel(dict: dict)
                    listShift.append(model)
                }
            }
            print(listShift[0].ten_cd)
            success(listShift)
        }, failure: { (error) in
            print(error.localizedDescription)
            
        })
    }
    
    func getUsers(apiKey: String, success: @escaping ([UserModel]) -> Void,
                  failure: @escaping (_ err: Error) -> Void) {
        var listShift:[UserModel] = []
        NetworkManager.shared.getItemsWithKey(urlFeature: "http://demo.ketoanmoka.com/api/user",apiKey: apiKey, success: { (dataRs) in
            if let aData = (dataRs as! [String:Any])["data"] as? NSArray {
                for dict in aData {
                    let model = UserModel(dict: dict)
                    listShift.append(model)
                }
            }
            print(listShift[0].user_name)
            success(listShift)
        }, failure: { (error) in
            print(error.localizedDescription)
            
        })
    }
    
    func getVattuInfo(apiKey: String, mavt : String, success: @escaping ([VattuModel]) -> Void,
                      failure: @escaping (_ err: Error) -> Void) {
        var listShift:[VattuModel] = []
        NetworkManager.shared.getItemsWithKey(urlFeature: "http://demo.ketoanmoka.com/api/dmvt/" + mavt,apiKey: apiKey, success: { (dataRs) in
            if let aData = (dataRs as! [String:Any])["data"] as? NSArray {
                for dict in aData {
                    let model = VattuModel(dict: dict)
                    listShift.append(model)
                }
            }
            print(listShift[0].ten_vt)
            success(listShift)
        }, failure: { (error) in
            print(error.localizedDescription)
            
        })
    }
    
    func getCompanys(success: @escaping ([CompanyModel]) -> Void,
                   failure: @escaping (_ err: Error) -> Void) {
        var listShift:[CompanyModel] = []
        NetworkManager.shared.getItemsWithoutKey(urlFeature: "http://demo.ketoanmoka.com/api/unit", success: { (dataRs) in
            if let aData = (dataRs as! [String:Any])["data"] as? NSArray {
                for dict in aData {
                    let model = CompanyModel(dict: dict)
                    listShift.append(model)
                }
            }
            print(listShift[0].ten_dvcs)
            success(listShift)
        }, failure: { (error) in
            print(error.localizedDescription)
            
        })
    }
}
