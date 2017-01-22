//
//  BEOOrderAddListController.swift
//  BusEasyOrder
//  添加菜单
//  Created by 冯万琦 on 2017/1/4.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

enum CellType: Int {
    case Image = 1, Name = 2, Price = 3, Desc
}
class ThirdViewController: BaseTableViewController {
    //内容存储区
    let dataDict: Dictionary<CellType, Any?> = [CellType.Image: nil, CellType.Name: "", CellType.Price: "", CellType.Desc: ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func setUpView() {
        super.setUpView()
        //注册cell
        for type in dataArray! {
            let cellName = self.cellNameByType(type: type as! CellType)
            let nib: UINib = UINib.init(nibName: cellName, bundle: Bundle.main)
            self.tableView.register(nib, forCellReuseIdentifier: cellName)
        }
    }
    
    override func setUpData() {
        dataArray = [CellType.Image, CellType.Name, CellType.Price, CellType.Desc]
    }
    
    //获取cell名称
    func cellNameByType(type: CellType) -> String {
        switch type {
        case .Image:
            return "MenuAddImageCell"
        case .Desc:
            return "MenuAddContextCell"
        default:
            return "MenuAddTextCell"
        }
    }
    
    //获取cell内容
    func cellDataByType(type: CellType) -> Any? {
        let newDatadict = dataDict as Dictionary
        switch type {
        case .Image:
            return [AddImageName: "1.jpg"]
        case .Name:
            return  [TitleText: "名称", ContentText: newDatadict[CellType.Name] as? String]
        case .Price:
            return [TitleText: "价格", ContentText: newDatadict[CellType.Price]  as? String]
        case .Desc:
            return [TitleText: "描述", ContentText: newDatadict[CellType.Desc]  as? String]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type: CellType = dataArray![indexPath.row] as! CellType
        let data = self.cellDataByType(type: type)
        let cellName = self.cellNameByType(type: type)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! BaseCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.fillData(data)
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
