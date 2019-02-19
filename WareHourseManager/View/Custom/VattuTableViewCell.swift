//
//  VattuTableViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/18/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class VattuTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var name : UILabel!
    @IBOutlet var donvitinh : UILabel!
    @IBOutlet var soluong : UITextField!
    @IBOutlet var btnUpdate : UIButton!
    @IBOutlet var maNNLoi : UILabel!
    @IBOutlet var maLoi : UILabel!
    
    
    func updateInfo(name : String, donvitinh : String, soluong : Int) {
        self.name.text = name
        self.donvitinh.text = donvitinh
        self.soluong.text = soluong.description
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
