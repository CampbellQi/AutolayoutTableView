//
//  FirstTableViewCell.swift
//  AutolayoutTableView
//
//  Created by 冯万琦 on 2017/1/20.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

let ImageStr = "imageStr"
let TitleStr = "titleStr"
let ContentStr = "contentStr"
let timeStr = "timeStr"

class FirstCell: BaseCell {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    
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
                if let aImage = aData[ImageStr] {
                    iv.image = UIImage.init(named: aImage)
                }
                if let aTitle = aData[TitleStr] {
                    titleLbl.text = aTitle
                }
                if let aContent = aData[ContentStr] {
                    contentLbl.text = aContent
                }
                if let aTime = aData[timeStr] {
                    timeLbl.text = aTime
                }
            }
        }
    
}
