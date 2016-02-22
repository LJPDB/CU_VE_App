//
//  CustomNavBarController.swift
//  CU_VE_App
//
//  Created by Leonardo Puga-DeBiase on 2/17/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class CustomNavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleShadow: NSShadow = NSShadow()
        titleShadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        titleShadow.shadowOffset = CGSize(width: 0, height: 1)
        
        // font type and size in navbar
        self.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 16)!,
            NSShadowAttributeName: titleShadow
        ]
        self.navigationBar.translucent = false
        self.navigationBar.tintColor = UIColor.whiteColor()
        let fontDictionary = [ NSForegroundColorAttributeName:UIColor.whiteColor() ]
        self.navigationBar.titleTextAttributes = fontDictionary
        self.navigationBar.setBackgroundImage(imageLayerForGradientBackground(), forBarMetrics: UIBarMetrics.Default)
    }
    
    private func imageLayerForGradientBackground() -> UIImage {
        
        
        var updatedFrame = self.navigationBar.bounds
        // take into account the status bar
        updatedFrame.size.height += 20
        let layer = CAGradientLayer.gradientLayerForBounds(updatedFrame)
        UIGraphicsBeginImageContext(layer.bounds.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
