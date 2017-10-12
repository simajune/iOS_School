//
//  SlideOut.swift
//  171012_PageView
//
//  Created by SIMA on 2017. 10. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class SlideLeft: UIStoryboardSegue {
    override func perform() {
        let source = self.source
        let destination = self.destination
        
        source.view.superview?.insertSubview(destination.view, aboveSubview: source.view)
        destination.view.transform = CGAffineTransform(translationX: -source.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: {finished in source.present(destination, animated: false, completion: nil) })
        
    }
}

class SlideRight: UIStoryboardSegue {
    override func perform() {
        let source = self.source
        let destination = self.destination
        
        source.view.superview?.insertSubview(destination.view, aboveSubview: source.view)
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: {finished in source.present(destination, animated: false, completion: nil) })
        
    }
}
