//
//  BEOOrderAddTextCell.swift
//  BusEasyOrder
//
//  Created by 冯万琦 on 2017/1/5.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

let TitleText = "nameText"
let ContentText = "contentText"

class MenuAddTextCell: BaseCell {
    
    @IBOutlet weak var contentTF: UITextField!
    @IBOutlet weak var titleTF: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func fillData(_ data: Any?) {
        if let newData = data as? Dictionary<String, String>{
            self.contentTF.text = newData[ContentText]
            self.titleTF.text = newData[TitleText]
        }
    }
}
