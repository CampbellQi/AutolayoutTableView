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

typealias TextChangedBlock = (_ text: String) -> Void

class MenuAddTextCell: BaseCell, UITextFieldDelegate {
    
    @IBOutlet weak var contentTF: UITextField!
    @IBOutlet weak var titleTF: UILabel!
    
    var textChangedBlock: ((_ text: String) -> Void)?
    
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
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let block = textChangedBlock {
            block(textField.text!)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let block = textChangedBlock {
            block(textField.text! + string)
        }
        return true
    }
    
}
