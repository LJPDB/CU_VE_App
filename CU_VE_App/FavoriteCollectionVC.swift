//
//  FavoriteMovieVC.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 2/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class FavoriteCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    
    var doWeHaveData:Bool = false
    var collectionViewItemsArray : [AnyObject]?
    var testSegueVar:String = "" {
        didSet {
            testVarSetting(testSegueVar)
        }
    }
    
    override func viewDidLoad(){
        //super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testVarSetting(varX: String){
        MeaningAndFormValidation.printMessageWithText("Fucking A! it works!", className: String(self))
    }
    
    // MARK: - Collection View Methods
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("favoriteSimpleCell", forIndexPath: indexPath)
        if !doWeHaveData {
            let loadingGif : UIActivityIndicatorView = cell.viewWithTag(3) as! UIActivityIndicatorView
            loadingGif.startAnimating()
        }else{
            
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        // do something when select an collection cell
    }
    
    
    
    // MARK: - CollectionViewDelegateFlowOut methods
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let customItemSize : CGSize = self.view.frame.size
        //let getDeviceProportions : [CGFloat] = MeaningAndFormValidation.getProportionsDependingOnDeviceType()
        //customItemSize = CGSize(width: (customItemSize.width - 2)/getDeviceProportions[0], height: (customItemSize.height - 2)/getDeviceProportions[1])
        return customItemSize
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

