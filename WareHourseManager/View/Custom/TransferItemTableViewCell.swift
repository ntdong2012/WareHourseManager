//
//  TransferItemTableViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/12/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit
import DropDown

class TransferItemTableViewCell: UITableViewCell {

    @IBOutlet var label : UILabel!
    @IBOutlet var labelContent: UILabel!
    
    var labelInfoDropdown : DropDown!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        labelContent.layer.borderColor = UIColor.gray.cgColor
        labelContent.layer.borderWidth = 0.5
        labelContent.layer.cornerRadius = 4
        labelContent.layer.masksToBounds = true
        
        labelContent.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.tapFunction(sender:)))
        self.labelContent.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
    }
    
    func getCurrentLabel() -> String {
        return label.text!
    }
    
    func getCurrentLabelContent() ->String {
        return labelContent.text!
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        if(self.tag == 1 || self.tag == 2){
            labelInfoDropdown.show()
        }
    }
    
    func showDialog(_ listInfos : [String]){
        labelInfoDropdown = DropDown()
        labelInfoDropdown.anchorView = labelContent // UIView or UIBarButtonItem in your case that menu button
        labelInfoDropdown.dataSource = listInfos
        
        labelInfoDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.labelContent.text = listInfos[index]
        }
    }
    
    
    func setLabelStr(labelStr : String, labelContentStr: String){
        self.label.text = labelStr
        self.labelContent.text = labelContentStr
    }
    
    func setLabelContentStr(labelContentStr: String){
        self.labelContent.text = labelContentStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
