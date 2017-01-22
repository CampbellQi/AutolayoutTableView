//
//  BEOOrderAddImageCell.swift
//  BusEasyOrder
//
//  Created by 冯万琦 on 2017/1/5.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit
let AddImageName = "addImageName"

class MenuAddImageCell: BaseCell {

    @IBOutlet weak var iv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func fillData(_ data: Any?) {
        if let aData = data as? Dictionary<String, String> {
            if let aName = aData[AddImageName] {
                iv.image = UIImage.init(named: aName)
            }
            
        }
    }
}
