//
//  SliderVC.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 2/2/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class SliderVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionViewItemsArray : [AnyObject]?
    var doWeHaveData : Bool = false
    var testSegueVar:String = "" {
        didSet {
            testVarSetting(testSegueVar)
        }
    }
    @IBOutlet weak var principalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func testVarSetting(varX: String){
        MeaningAndFormValidation.printMessageWithText("Fucking A! it works!", className: String(self))
    }
    
    // MARK: - CollectionView methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("simplePrincipalCell", forIndexPath: indexPath)
        if !doWeHaveData {
            let loadingGif : UIActivityIndicatorView = cell.viewWithTag(3) as! UIActivityIndicatorView
            loadingGif.startAnimating()
        }else{
            
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        // do something when select an collection cell
        
    }
    
    
    
    // MARK: - CollectionViewDelegateFlowOut methods
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var customItemSize : CGSize = self.view.frame.size
        //let getDeviceProportions : [CGFloat] = MeaningAndFormValidation.getProportionsDependingOnDeviceType()
        customItemSize = CGSize(width: customItemSize.width, height: customItemSize.height)
        //customItemSize = CGSize(width: (customItemSize.width / 1.05), height: customItemSize.height)
        return customItemSize
        //return self.view.frame.size
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        /*    if self.collectionViewSourceElement.{
        
        }else{
        
        }  */
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
