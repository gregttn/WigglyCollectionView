//
//  WigglyCollectionViewController.swift
//  WigglyCollectionView
//
//  Created by Grzegorz Tatarzyn on 23/02/2016.
//  Copyright © 2016 Grzegorz Tatarzyn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class WigglyCollectionViewController: UICollectionViewController {

    let colors = [UIColor.redColor(), UIColor.darkGrayColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.purpleColor(), UIColor.orangeColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let longPressGesturerecognizer = UILongPressGestureRecognizer(target: self, action: "longPressDetected:")
        collectionView?.addGestureRecognizer(longPressGesturerecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = colors[indexPath.row]
    
        return cell
    }
    
    func longPressDetected(gestureRecognizer: UILongPressGestureRecognizer) {
        let touchLocation = gestureRecognizer.locationInView(collectionView)
        let cellIndex = collectionView?.indexPathForItemAtPoint(touchLocation)
        
        if let index = cellIndex {
            let cell = collectionView?.cellForItemAtIndexPath(index)
            
            let angle: CGFloat = CGFloat(2.0 * M_PI / 180)
            cell?.transform = CGAffineTransformMakeRotation(-angle)
            UIView.animateWithDuration(0.1, delay: 0, options: [UIViewAnimationOptions.Autoreverse ,UIViewAnimationOptions.Repeat], animations: { () -> Void in
                cell?.transform = CGAffineTransformMakeRotation(angle)
            }, completion: nil)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
