//
//  LabelTableViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/6/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit
import DropDown

class LabelTableViewCell: UITableViewCell {

    @IBOutlet var label : UILabel!
    var shiftDropDown : DropDown!
    var companyDropDown : DropDown!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.tapFunction(sender:)))
        self.label.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        
        
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        if(self.label.tag == 3 ) {
            shiftDropDown.show()
        } else {
            companyDropDown.show()
        }
    }
    
    
    func showShiftDialog(_ listShift : [ShiftModel]){
        shiftDropDown = DropDown()
        shiftDropDown.anchorView = label // UIView or UIBarButtonItem in your case that menu button
        
        // The list of items to display. Can be changed dynamically
        var shiftDisplayList : [String] = []
        if(listShift.count>0){
            for  i  in 0 ..< listShift.count {
                shiftDisplayList.append(listShift[i].ma_ca + " - " + listShift[i].ten_ca);
            }
        }
        shiftDropDown.dataSource = shiftDisplayList
        
        shiftDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.label.text = shiftDisplayList[index]
        }
    }
    
    func showCompanyDialog(_ listCompany : [CompanyModel]){
        companyDropDown = DropDown()
        companyDropDown.anchorView = label // UIView or UIBarButtonItem in your case that menu button
        
        // The list of items to display. Can be changed dynamically
        var shiftDisplayList : [String] = []
        if(listCompany.count>0){
            for  i  in 0 ..< listCompany.count {
                shiftDisplayList.append(listCompany[i].ma_dvcs + " - " + listCompany[i].ten_dvcs);
            }
        }
        companyDropDown.dataSource = shiftDisplayList
        
        companyDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.label.text = shiftDisplayList[index]
        }
    }

    func setText(_ str: String){
        label.text = str
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
