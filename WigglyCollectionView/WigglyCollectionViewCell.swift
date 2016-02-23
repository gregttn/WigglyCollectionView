//
//  WigglyCollectionViewCell.swift
//  WigglyCollectionView
//
//  Created by Grzegorz Tatarzyn on 23/02/2016.
//  Copyright © 2016 Grzegorz Tatarzyn. All rights reserved.
//

import UIKit

class WigglyCollectionViewCell: UICollectionViewCell {
    final let rotationAngle: CGFloat = CGFloat(2.0 * M_PI / 180)
    final let rotationOptions: UIViewAnimationOptions = [.Autoreverse , .Repeat , .CurveEaseInOut, .AllowUserInteraction]
    
    private(set) var wiggling = false
    
    func wiggle() {
        wiggling = true
        transform = CGAffineTransformMakeRotation(-rotationAngle)
        
        UIView.animateWithDuration(0.09, delay: 0, options: rotationOptions, animations: { () -> Void in
            self.transform = CGAffineTransformMakeRotation(self.rotationAngle)
        }, completion: nil)
    }
    
    func stopWiggling() {
        wiggling = false
        transform = CGAffineTransformIdentity
        
        layer.removeAllAnimations()
    }
}

