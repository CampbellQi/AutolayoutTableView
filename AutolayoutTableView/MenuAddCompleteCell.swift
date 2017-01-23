//
//  MenuAddCompleteCell.swift
//  AutolayoutTableView
//
//  Created by 冯万琦 on 2017/1/23.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

typealias CompleteBlock = (Void) -> Void

class MenuAddCompleteCell: BaseCell {

    var completeBlock: CompleteBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func completeBtnClicked(_ sender: Any) {
        if let aCompleteBlock = completeBlock {
            aCompleteBlock()
        }
    }
    
}
