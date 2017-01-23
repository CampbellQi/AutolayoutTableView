//
//  BEOOrderAddListController.swift
//  BusEasyOrder
//  添加菜单
//  Created by 冯万琦 on 2017/1/4.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit

class SecondViewController: BaseTableViewController, UITextFieldDelegate {
    enum CellType: Int {
        case Image = 1,Text , Complete
    }
    
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
        dataArray = [CellType.Image, CellType.Text, CellType.Complete]
    }
    
    //获取cell名称
    func cellNameByType(type: CellType) -> String {
        switch type {
        case .Image:
            return "MenuAddImageCell"
        case .Text:
            return "FirstCell"
        case .Complete:
            return "MenuAddCompleteCell"
        default:
            return "MenuAddTextCell"
        }
    }
    
    //获取cell内容
    func cellDataByType(type: CellType) -> Any? {
        switch type {
        case .Image:
            return [AddImageName: "1.jpg"]
        case .Text:
            var dict: Dictionary<String, String> = [:]
            //文字读取
            let path = Bundle.main.path(forResource: "FirstData", ofType: "plist")
            let textDic: Dictionary<String, String> = NSDictionary(contentsOfFile: path!) as! Dictionary<String, String>
            
            dict[ImageStr] = "1.jpg"
            dict[TitleStr] = Array(textDic.keys)[1]
            dict[ContentStr] = Array(textDic.values)[1]
            dict[TitleStr] = "2016-12-21 12:21"
            return  dict
        default:
            return nil
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
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
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
