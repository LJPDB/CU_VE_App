//
//  HomeVC.swift
//  CU_VE_App
//
//  Created by Daniel Puga on 10/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit


class HomeVC : UIViewController {  //, SideBarDelegate

    @IBOutlet weak var sliderContainerVC: UIView!
    @IBOutlet weak var collectionContainerVC: UIView!
    @IBOutlet weak var favoriteContainerVC: UIView!
    var segueDestinationSliderVC:SliderVC?
    var segueDestinationCollectionMoviesVC:CollectionMoviesVC?
    var segueDestinationFavoriteVC:FavoriteCollectionVC?
    var WSC : WebServicesConnection?
    var movieWSC : MovieServices?
    var internetConn : Reachability?
    var doWeHaveData1:Bool = true
    var doWeHaveData2:Bool = true
    var doWeHaveData3:Bool = true
    
    var testSegueFromPresentation:String = "" {
        didSet {
            dataReceivedFromPresentationLayer(testSegueFromPresentation)
        }
    }
    
    //var sideBarItem:SideBar = SideBar()
    
    override func viewDidLoad() {
       // super.viewDidLoad()
//        var segueAux:UIStoryboardSegue = UIStoryboardSegue.
  //      self.prepareForSegue(<#T##segue: UIStoryboardSegue##UIStoryboardSegue#>, sender: <#T##AnyObject?#>)
        
      //  performSegueWithIdentifier("toSliderVC", sender: self)
      //  performSegueWithIdentifier("toCollectionMoviesVC", sender: self)
      //  performSegueWithIdentifier("toFavoriteVC", sender: self)
        
        //sideBarItem = SideBar(sourceView: self.view, tableDataSections: ["Section1"], tableDataSectionsOptions: [["option1", "option2", "option3"]])
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.WSC = (delegate?.globalWSC)!
        self.movieWSC = self.WSC!.getServiceObjectFromGroup("movie") as? MovieServices
        self.internetConn = (delegate?.deviceNetConn)!
        MeaningAndFormValidation.printMessageWithText("Wifi reach: \(self.internetConn?.isReachableViaWiFi())", className: String(self))
        MeaningAndFormValidation.printMessageWithText("Phone Cell Data reach: \(self.internetConn?.isReachableViaWWAN())", className: String(self))
        
        //set dynamically heights for the containers..!!!!
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenHeight = screenSize.height
        let screenWidth = screenSize.width
        //Movies Slider container
       /* self.sliderContainerVC.frame.origin = CGPointMake(0, 0)// (x: 0, y: 0, width: screenWidth, height: screenHeight * 0.4)
        self.sliderContainerVC.frame.size = CGSizeMake(screenWidth, (screenHeight * 0.35))
        // Movies Collection container
        self.collectionContainerVC.frame.origin = CGPointMake(0, (screenHeight * 0.35))
        self.collectionContainerVC.frame.size = CGSizeMake(screenWidth, screenHeight * 0.35)
        
        // Favorite Movie container
        self.favoriteContainerVC.frame.origin = CGPointMake(0, (screenHeight * 0.7))
        self.favoriteContainerVC.frame.size = CGSizeMake(screenWidth, (screenHeight * 0.3)) */
        
        /*
        self.sliderContainerVC.layer.shadowColor = UIColor.blackColor().CGColor
        //self.sliderContainerVC.layer.shadowOffset = CGSize(width: 50.0, height: 25.0)
        self.sliderContainerVC.layer.shadowOpacity = 0.4
        self.sliderContainerVC.layer.shadowOffset = CGSizeZero
        self.sliderContainerVC.layer.shadowRadius = 5
        self.sliderContainerVC.layer.shadowPath = UIBezierPath(rect:  self.sliderContainerVC.bounds).bezierPathByReversingPath() as? CGPath
        self.sliderContainerVC.layer.shouldRasterize = true
*/
        
    /*    let shadowView = UIView(frame: self.navigationController!.navigationBar.frame)
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.6 // your opacity
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 4) // your offset
        shadowView.layer.shadowRadius =  2 //your radius
        self.view.addSubview(shadowView)  */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideBarDidSelectButtonAtIndex(index: Int) {
        //
    }
    
    
    // MARK: - Before/After Segues methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "toSliderVC": if doWeHaveData1 {  // if all the movies arrays for each one of the children views are done, then we can call the
            MeaningAndFormValidation.printMessageWithText("'toSliderVC' segue", className: String(self))
            if (segueDestinationSliderVC == nil) { segueDestinationSliderVC = segue.destinationViewController as? SliderVC }
            segueDestinationSliderVC!.testSegueVar = "testing SLIDER segue"
            }
        case "toCollectionMoviesVC": if doWeHaveData2 {
            MeaningAndFormValidation.printMessageWithText("'toCollectionMoviesVC' segue", className: String(self))
            
            if (segueDestinationCollectionMoviesVC == nil) { segueDestinationCollectionMoviesVC = segue.destinationViewController as? CollectionMoviesVC }
            segueDestinationCollectionMoviesVC!.testSegueVar = "testing MOVIES_COLLECTION segue"
            }
        case "toFavoriteVC": if doWeHaveData3 {
            MeaningAndFormValidation.printMessageWithText("'toFavoriteVC' segue", className: String(self))
            if (segueDestinationFavoriteVC == nil) { segueDestinationFavoriteVC = segue.destinationViewController as? FavoriteCollectionVC }
            segueDestinationFavoriteVC!.testSegueVar = "testing FAVORITE segue"
            }
            
        default: MeaningAndFormValidation.printErrorWithText("Wrong segue name", className: String(self))
        }
        
    }
    
    func dataReceivedFromPresentationLayer(valueReceivedFromPresentation:String){
        MeaningAndFormValidation.printMessageWithText("Hell yeah! we received you successfully from PRESENTATION LAYER: \(valueReceivedFromPresentation)", className: String(self))
    }
    
}



/*********** top super view (navbar shadow like) top shadow
let layer = CAGradientLayer()
layer.startPoint    = CGPointMake(0.5, 0.0);
layer.endPoint      = CGPointMake(0.5, 1.0);
layer.colors        = [UIColor(white: 0.1, alpha: 0.8).CGColor, UIColor(white: 0.1, alpha: 0.5).CGColor, UIColor.clearColor().CGColor]
layer.locations     = [0.05, 0.2, 1.0 ]
layer.frame         = CGRectMake(0, 0, self.sliderContainerVC.frame.width, 8)
self.view.layer.insertSublayer(layer, atIndex: 0)
*/
