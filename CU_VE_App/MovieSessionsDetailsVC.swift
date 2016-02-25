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
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var moviePosterImage_Container: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviePosterImage_Container.layer.borderWidth = 5
        self.moviePosterImage_Container.layer.borderColor = UIColor.whiteColor().CGColor
        moviePosterImage_Container.layer.shadowOffset = CGSize(width: 4, height: 4)
        moviePosterImage_Container.layer.shadowOpacity = 0.7
        moviePosterImage_Container.layer.shadowRadius = 1.0
        MeaningAndFormValidation.printMessageWithText("class is loaded", className: String(self))
        //self.presentedViewController?.dismissViewControllerAnimated(true, completion: {})
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("userTappedImage:"))
        moviePosterImage.userInteractionEnabled = true
        moviePosterImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func userTappedImage(img:AnyObject){
        let uialert:UIAlertController = UIAlertController.init(title: "Image Event", message: "User tapped", preferredStyle: UIAlertControllerStyle.Alert)
        uialert.addAction(UIAlertAction(title: "Got It!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(uialert, animated: true, completion:nil)
    }
    
    
}
