//
//  NetworkManager.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/1/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking
class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    let manager = AFHTTPSessionManager()
    
    func getItemsWithoutKey(urlFeature : String,
                         success: @escaping (_ result: Any) -> Void,
                         failure: @escaping (_ err: Error) -> Void){
        let urlString = urlFeature//Constant.API_URL + Constant.API_PATCH + apiname
        print("url = \(urlString)")
        manager.requestSerializer.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        manager.requestSerializer.setValue(Constant.API_USERNAME, forHTTPHeaderField: "apiKey")
//        manager.requestSerializer.setValue(Constant.API_PASSWORD, forHTTPHeaderField: "apiPassword")
//        manager.requestSerializer.setValue("Basic YWRtaW46NlFsZjRUZ3RVOQ==", forHTTPHeaderField: "Authorization")
        manager.requestSerializer.timeoutInterval = 200
        manager.get(urlString, parameters: [:], progress: { (progress) in
            
        }, success: { (session, data) in
            print("data result : ")
            print(data ?? "")
            //if let response = (data as? [String: Any]), (response["success"] as? Bool) == true {
                //print(response);
                success(data)
//            }else{
//                //success(nil)
//            }
        }) { (session, error) in
            failure(error)
        }
    }
    
    
    func getItemsWithKey(urlFeature : String, apiKey: String,
                            success: @escaping (_ result: Any) -> Void,
                            failure: @escaping (_ err: Error) -> Void){
        let urlString = urlFeature//Constant.API_URL + Constant.API_PATCH + apiname
        print("url = \(urlString)")
        manager.requestSerializer.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //        manager.requestSerializer.setValue(Constant.API_USERNAME, forHTTPHeaderField: "apiKey")
        //        manager.requestSerializer.setValue(Constant.API_PASSWORD, forHTTPHeaderField: "apiPassword")
        manager.requestSerializer.setValue("Bearer " + apiKey, forHTTPHeaderField: "Authorization")
        manager.requestSerializer.timeoutInterval = 200
        manager.get(urlString, parameters: [:], progress: { (progress) in
            
        }, success: { (session, data) in
            print("data result : ")
            print(data ?? "")
            //if let response = (data as? [String: Any]), (response["success"] as? Bool) == true {
            //print(response);
            success(data)
            //            }else{
            //                //success(nil)
            //            }
        }) { (session, error) in
            failure(error)
        }
    }
    
    
    func callingHttpPostMethodWithJson(params:[String:Any],
                                       apiname : String,
                                       success: @escaping (_ result: Any?) -> Void,
                                       failure: @escaping (_ err: Error) -> Void){
        let urlString = Constant.API_URL + apiname
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        manager.requestSerializer.setValue(Constant.API_USERNAME, forHTTPHeaderField: "apiKey")
//        manager.requestSerializer.setValue(Constant.API_PASSWORD, forHTTPHeaderField: "apiPassword")
        //print("usernaem =\(Constant.API_USERNAME), pass = \(Constant.API_PASSWORD)")
        //print(manager.requestSerializer.httpRequestHeaders)
//        manager.requestSerializer.setValue("Basic YWRtaW46NlFsZjRUZ3RVOQ==", forHTTPHeaderField: "Authorization")
        manager.requestSerializer.timeoutInterval = 200
        
        manager.post(urlString, parameters: params, progress: { (progress) in
            //print("progress = \(progress)")
        }, success: { (session, data) in
            //print(data)
            //if let response = (data as? [String: Any]), (response["success"] as? Bool) == true {
                //print(response);
                success(data)
//            }else{
//                success(nil)
//            }
        }) { (session, error) in
            failure(error)
        }
    }
    
}
