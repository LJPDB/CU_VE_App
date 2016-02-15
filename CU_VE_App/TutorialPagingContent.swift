//
//  SliderPagingContent.swift
//  CU_VE_App
//
//  Created by Daniel Puga on 11/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class TutorialPagingContent: UIViewController {
    @IBOutlet weak var tutorialImageDisplayContainer: UIImageView!
    // TODO
    
    var pageIndex: Int!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //
    }
}
