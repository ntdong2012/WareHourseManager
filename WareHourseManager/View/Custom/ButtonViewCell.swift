//
//  ButtonViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/6/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit
protocol OptionButtonsDelegate{
    func loginBtnClick(at index:IndexPath)
}

class ButtonViewCell: UITableViewCell {

    @IBOutlet var button : UIButton!
    var delegate:OptionButtonsDelegate!
    @IBOutlet weak var closeFriendsBtn: UIButton!
    var indexPath:IndexPath!
    @IBAction func closeFriendsAction(_ sender: UIButton) {
        self.delegate?.loginBtnClick(at: indexPath)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonClick(){
        print ("button click")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
