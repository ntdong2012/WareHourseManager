//
//  TransferEditTableViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/13/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class TransferEditTableViewCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet var label : UILabel!
    @IBOutlet var infoEdt : UITextField!
    
    func setLabel (labelStr : String){
        self.label.text = labelStr
    }
    
    func setInfoEdt(infoStr: String){
        self.infoEdt.text = infoStr
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
