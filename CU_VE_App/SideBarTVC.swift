//
//  SideBarTVC.swift
//  CU_VE_App
//
//  Created by Leonardo Puga-DeBiase on 2/10/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

protocol SideBarTVCDelegate{
    func sideBarControlDidSelectRow(indexPath: NSIndexPath)
}

class SideBarTVC: UITableViewController {
    
    var delegate:SideBarTVCDelegate?
    var tableDataSections:Array<String> = []
    var tableDataSectionsOptions:Array<Array<String>> = [[]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableView Data source methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableDataSections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableDataSectionsOptions[section].count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("SideBarCell"))
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "SideBarCell")
            //cell!.backgroundColor = UIColor.colorWithAlphaComponent(white)(0.5)
            cell!.backgroundColor = UIColor.clearColor()
            cell!.selectionStyle = UITableViewCellSelectionStyle.Gray //here we set selection table view cell color
            //let white = UIColor.whiteColor() // 1.0 alpha
            //let semi = white.colorWithAlphaComponent(0.5) // 0.5 alpha
            cell?.textLabel?.textColor = UIColor.grayColor()
        }
        
        var sectionOptions:[String] = tableDataSectionsOptions[indexPath.section]
        cell!.textLabel?.text = sectionOptions[indexPath.row]
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.sideBarControlDidSelectRow(indexPath)
    }
    
}
