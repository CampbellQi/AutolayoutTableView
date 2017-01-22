//
//  FirstViewController.swift
//  AutolayoutTableView
//
//  Created by 冯万琦 on 2017/1/20.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class FirstViewController: BaseTableViewController {
    let _cellId = "FirstCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpData() {
        super.setUpData()
        //数据源
        //文字读取
        let path = Bundle.main.path(forResource: "FirstData", ofType: "plist")
        let textDic: Dictionary<String, String> = NSDictionary(contentsOfFile: path!) as! Dictionary<String, String>
        
        for i in 1...10 {
            var dict: [String : String] = [:]
            
            dict[ImageStr] = "\(i).jpg"
            dict[TitleStr] = ""
            dict[ContentStr] = ""
            dict[TitleStr] = "2016-12-21 12:21"
            
            if i-1 < textDic.count {
                dict[TitleStr] = Array(textDic.keys)[i-1]
                dict[ContentStr] = Array(textDic.values)[i-1]
            }
            dataArray?.append(dict)
        }
        
        tableView.reloadData()
    }
    override func setUpView() {
        super.setUpView()
        //注册cell
        self.tableView.register(UINib.init(nibName: _cellId, bundle: Bundle.main), forCellReuseIdentifier: _cellId)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FirstCell = tableView.dequeueReusableCell(withIdentifier: _cellId) as! FirstCell
        
        cell.fillData(dataArray![indexPath.row])
        return cell;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let aArray = dataArray {
            return aArray.count
        }else {
            return 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

