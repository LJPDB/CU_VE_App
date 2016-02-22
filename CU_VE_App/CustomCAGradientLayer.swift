//
//  CustomCAGradientLayer.swift
//  CU_VE_App
//
//  Created by Leonardo Puga-DeBiase on 2/17/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

extension CAGradientLayer{
    class func gradientLayerForBounds(bounds: CGRect) -> CAGradientLayer {
        //  CU Looking like Colors
        let topColor:UIColor = UIColor(red: 196/255, green: 24/255, blue: 24/255, alpha: 1.0)
        let bottomColor:UIColor = UIColor(red: 125/255, green: 15/255, blue: 15/255, alpha: 1.0)
        
        //  Cinex Looking like Colors
        //let topColor:UIColor = UIColor(red: 69/255, green: 139/255, blue: 209/255, alpha: 1.0)
        //let bottomColor:UIColor = UIColor(red: 44/255, green: 104/255, blue: 163/255, alpha: 1.0)
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [topColor.CGColor, bottomColor.CGColor]
        return layer
    }
}
