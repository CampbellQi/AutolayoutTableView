//
//  MenuAddContextCell.swift
//  AutolayoutTableView
//
//  Created by 冯万琦 on 2017/1/22.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class MenuAddContextCell: BaseCell, UITextViewDelegate {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descTV: UITextView!
    
    var textChangedBlock: ((_ text: String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.descTV.layer.borderColor = UIColor.lightGray.cgColor
        self.descTV.layer.borderWidth = 1.0
        self.descTV.layer.cornerRadius = 8.0
        
        descTV.delegate = self
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let block = textChangedBlock {
            block(textView.text!)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let block = textChangedBlock {
            block(textView.text!)
        }
    }
    
    override func fillData(_ data: Any?) {
        if let aData = data as? Dictionary<String, String> {
            if let aTitle = aData[TitleText]  {
                titleLbl.text = aTitle
            }
            if let aDesc = aData[ContentText] {
                descTV.text = aDesc
            }
        }
    }
}
