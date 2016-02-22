//
//  CustomUITabBar.swift
//  CU_VE_App
//
//  Created by Leonardo Puga-DeBiase on 2/17/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class CustomUITabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  CU Looking like Colors
        let tabBarTextColor:UIColor = UIColor.whiteColor()
        let bckgrdColor:UIColor = UIColor(red: 163/255, green: 18/255, blue: 18/255, alpha: 1.0)
        
        //  Cinex Looking like Colors
        //let tabBarTextColor:UIColor = UIColor.whiteColor()
        //let bckgrdColor:UIColor = UIColor(red: 44/255, green: 104/255, blue: 163/255, alpha: 1.0)
        
        self.tabBar.barTintColor = bckgrdColor
        self.tabBar.tintColor = tabBarTextColor
    }
}
