//
//  MyCollectionViewCell.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/30/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var image : UIImageView!
    @IBOutlet var label : UILabel!
    
    public func displayContent(label : String, imageUID : String) {
        self.label.text = label
        let yourImage: UIImage = UIImage(named: imageUID)!
        self.image.image = yourImage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
