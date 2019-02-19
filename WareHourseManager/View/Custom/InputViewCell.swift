//
//  InputViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/1/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class InputViewCell: UITableViewCell {

    @IBOutlet var inputTextField : UITextField!
    
    func setBoder(){
        inputTextField.borderStyle = UITextBorderStyle.roundedRect;
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setPlaceHolder(placeholder : String){
        inputTextField.placeholder = placeholder;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
