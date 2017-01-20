//
//  FirstViewController.swift
//  AutolayoutTableView
//
//  Created by 冯万琦 on 2017/1/20.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    let _cellId = "FirstCell"
    var _datArray: Array<Dictionary<String, String>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tableview预估高度、必须设置，否则高度无法自动估算
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        //注册cell
        self.tableView.register(UINib.init(nibName: _cellId, bundle: Bundle.main), forCellReuseIdentifier: _cellId)
        //数据源
        _datArray = []
        for i in 1...10 {
            var dict: [String : String] = [:]
            
            dict[ImageStr] = "\(i).jpg"
            dict[TitleStr] = ""
            dict[ContentStr] = ""
            dict[TitleStr] = "2016-12-21 12:21"
            
            _datArray?.append(dict)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FirstCell = tableView.dequeueReusableCell(withIdentifier: _cellId) as! FirstCell
        
        cell.fillData(_datArray![indexPath.row])
        return cell;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let aArray = _datArray {
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

