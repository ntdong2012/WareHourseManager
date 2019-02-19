//
//  ItemObj.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/30/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import Foundation
class ItemObj {
    
    let name : String!
    let imageId: String!
    let apiCode : String!
    let apiType : String!
    let apiSP : String!
    
    
    init(name: String, imageId: String, apiCode: String, apiType: String, apiSP : String){
        self.name = name
        self.imageId = imageId
        self.apiCode = apiCode
        self.apiType = apiType
        self.apiSP = apiSP
    }
}
