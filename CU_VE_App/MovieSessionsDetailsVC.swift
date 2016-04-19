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
    @IBOutlet weak var TestLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var moviePosterImage_Container: UIView!
    
    var stringArray = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocalizeItems()
        
        moviePosterImage.layer.borderWidth = 4
        moviePosterImage.layer.borderColor = UIColor.whiteColor().CGColor
        moviePosterImage.layer.shadowOffset = CGSize(width: 4, height: 4)
        moviePosterImage.layer.shadowOpacity = 0.7
        moviePosterImage.layer.shadowRadius = 1.5
        
        MeaningAndFormValidation.printMessageWithText("class is loaded", className: String(self))
        //self.presentedViewController?.dismissViewControllerAnimated(true, completion: {})
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("userTappedImage:"))
        moviePosterImage.userInteractionEnabled = true
        moviePosterImage.addGestureRecognizer(tapGestureRecognizer)
        TestLabel.text = stringArray["genre"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func userTappedImage(img:AnyObject){
        let uialert:UIAlertController = UIAlertController.init(title: "Image Event", message: "User tapped", preferredStyle: UIAlertControllerStyle.Alert)
        uialert.addAction(UIAlertAction(title: "Got It!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(uialert, animated: true, completion:nil)
    }
    
    
    func setLocalizeItems(){        
        stringArray["genre"] = ""
        stringArray["duration"] = ""
        stringArray["info"] = ""
        stringArray["movieSchedule"] = ""
        stringArray["hall"] = ""
        stringArray["monday"] = ""
        stringArray["thursday"] = ""
        stringArray["wednesday"] = ""
        stringArray["friday"] = ""
        stringArray["saturday"] = ""
        stringArray["sunday"] = ""
        stringArray["tuesday"] = ""
        stringArray = MeaningAndFormValidation.getLocalizeStrings(stringArray)
        print(stringArray)
    }
    
}
