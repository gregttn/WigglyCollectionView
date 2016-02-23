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

        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressDetected:")

        collectionView?.addGestureRecognizer(gestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
        
        guard let index = cellIndex else {
            return
        }
        
        if gestureRecognizer.state == .Began {
            let cell = collectionView?.cellForItemAtIndexPath(index) as? WigglyCollectionViewCell
            
            switch cell {
            case .Some(let cell) where !cell.wiggling:
                cell.wiggle()
            case .Some(let cell) where cell.wiggling:
                cell.stopWiggling()
            default:
                print("No cell")
            }
        }
    }
}
