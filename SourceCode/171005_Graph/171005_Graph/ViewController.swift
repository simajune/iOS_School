//
//  ViewController.swift
//  171005_Graph
//
//  Created by SIMA on 2017. 10. 5..
//  Copyright © 2017년 SIMA. All rights reserved.
//


extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        let newConstaint = NSLayoutConstraint(item: self.firstItem,
                                              attribute: self.firstAttribute,
                                              relatedBy: self.relation,
                                              toItem: self.secondItem,
                                              attribute: self.secondAttribute,
                                              multiplier: changeMultiplier,
                                              constant: self.constant)
        newConstaint.priority = self.priority
        newConstaint.shouldBeArchived = self.shouldBeArchived
        newConstaint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstaint])
        
        return newConstaint
    }
}

import UIKit

class ViewController: UIViewController {

    @IBOutlet var graph1Height: NSLayoutConstraint!
    @IBOutlet var graph2Height: NSLayoutConstraint!
    @IBOutlet var graph3Height: NSLayoutConstraint!
    @IBOutlet var graph4Height: NSLayoutConstraint!
    @IBOutlet var graph5Height: NSLayoutConstraint!
    @IBOutlet var graph6Height: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graph1Height = graph1Height.changeMultiplier(changeMultiplier: 0.5)
        graph1Height = graph1Height.changeMultiplier(changeMultiplier: 1.0)
        graph2Height = graph2Height.changeMultiplier(changeMultiplier: 0.25)
        graph3Height = graph3Height.changeMultiplier(changeMultiplier: 0.9)
        graph4Height = graph4Height.changeMultiplier(changeMultiplier: 1.0)
        graph5Height = graph5Height.changeMultiplier(changeMultiplier: 0.7)
        graph6Height = graph6Height.changeMultiplier(changeMultiplier: 0.6)
    }
    
    @IBAction func change1(_ sender: Any) {
        UIView.animate(withDuration: 0.5) { 
            self.graph1Height = self.graph1Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph2Height = self.graph2Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph3Height = self.graph3Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph4Height = self.graph4Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph5Height = self.graph5Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph6Height = self.graph6Height.changeMultiplier(changeMultiplier: 0.1)
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func change2(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1Height = self.graph1Height.changeMultiplier(changeMultiplier: 0.5)
            self.graph2Height = self.graph2Height.changeMultiplier(changeMultiplier: 0.25)
            self.graph3Height = self.graph3Height.changeMultiplier(changeMultiplier: 0.9)
            self.graph4Height = self.graph4Height.changeMultiplier(changeMultiplier: 1)
            self.graph5Height = self.graph5Height.changeMultiplier(changeMultiplier: 0.7)
            self.graph6Height = self.graph6Height.changeMultiplier(changeMultiplier: 0.6)
            self.view.layoutIfNeeded()
        }
    }
}

