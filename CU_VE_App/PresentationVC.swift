//
//  ViewController.swift
//  CU_VE_App
//
//  Created by Daniel Puga on 8/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class PresentationVC: UIViewController {

    //var sideBarItem:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sideBarItem = SideBar(sourceView: self.view, tableDataSections: ["Section1"], tableDataSectionsOptions: [["option1", "option2"]])
        let timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func timeToMoveOn() {
        self.performSegueWithIdentifier("homeWhenInfoLoaded", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "homeWhenInfoLoaded"{
            let navBarController:UINavigationController = segue.destinationViewController as! UINavigationController
            let auxTabBarController:UITabBarController = navBarController.visibleViewController as! UITabBarController
            let auxInitialTabBarVC:HomeVC = auxTabBarController.viewControllers?.first as! HomeVC
            
            auxInitialTabBarVC.testSegueFromPresentation = "Passing movies data...."
        }
    }


}

