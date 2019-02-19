//
//  TransferEdt2TableViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/13/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class TransferEdt2TableViewCell: UITableViewCell, UITextFieldDelegate{

    @IBOutlet var label : UILabel!
    @IBOutlet var edtInfoOne: UITextField!
    @IBOutlet var edtInfoTwo: UITextField!
    
    func setLabel(labelStr: String) -> Void {
        self.label.text = labelStr
    }
    
    func setInfos( productStr: String, quantity : Int64 ) {
        self.edtInfoOne.text = quantity.description
        self.edtInfoTwo.text = productStr
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
