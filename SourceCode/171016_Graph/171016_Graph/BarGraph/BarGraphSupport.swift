//
//  BarGraphSupport.swift
//  171016_Graph
//
//  Created by SIMA on 2017. 10. 16..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

@IBDesignable class BarGraphSupport: UIView {
    
    override func draw(_ rect: CGRect) {
        
        //Data
        let data  = [10,50,80,0,0,0,0,0,60,120,150,200,140,70,60,30,20,50,100,170,150,60,10,50]
        
        //support line
        let supportPath = UIBezierPath()
        
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 110))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 110))
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 160))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 160))
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 210))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 210))
        supportPath.move(to: CGPoint(x: 30, y: bounds.height - 260))
        supportPath.addLine(to: CGPoint(x: bounds.width - 30, y: bounds.height - 260))
        
        UIColor.gray.setStroke()
        supportPath.lineWidth = 0.5
        supportPath.stroke()
        
        //bar graph background
        let xDis = CGFloat((rect.width - 60) / 23)
        
        let graphBackgroundPath = UIBezierPath()
        
        for i in 0 ... 23 {
            graphBackgroundPath.move(to: CGPoint(x: 30 + (xDis * CGFloat(i)), y: bounds.height - 60))
            graphBackgroundPath.addLine(to: CGPoint(x: 30 + (xDis * CGFloat(i)), y: bounds.height - 65))
        }
        
        
        
        UIColor(red: 100/255, green: 0/255, blue: 0/255, alpha: 1.0).setStroke()
        graphBackgroundPath.lineWidth = 2
        graphBackgroundPath.stroke()
        
        //bar graph
        let graphPath = UIBezierPath()
        
        for i in 0 ... 23 {
            graphPath.move(to: CGPoint(x: 30 + (xDis * CGFloat(i)), y: bounds.height - 60))
            graphPath.addLine(to: CGPoint(x: 30 + (xDis * CGFloat(i)), y: bounds.height - 60 - CGFloat(data[i])))
        }
        
        UIColor.red.setStroke()
        graphPath.lineWidth = 2
        graphPath.stroke()
        
        
    }
    


}
