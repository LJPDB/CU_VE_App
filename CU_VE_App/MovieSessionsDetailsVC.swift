//
//  MovieSessionsDetailsVC.swift
//  CU_VE_App
//
//  Created by Leonardo Puga-DeBiase on 2/10/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class MovieSessionsDetailsVC: UIViewController {
    //TODO
    override func viewDidLoad() {
        super.viewDidLoad()
        MeaningAndFormValidation.printMessageWithText("class is loaded", className: String(self))
        self.presentedViewController?.dismissViewControllerAnimated(true, completion: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
