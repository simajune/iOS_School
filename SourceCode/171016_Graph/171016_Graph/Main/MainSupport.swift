

import UIKit

@IBDesignable class MainSupport: UIView {
    
    override func draw(_ rect: CGRect) {
        //border line
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: 10, y: 10))
        linePath.addLine(to: CGPoint(x: 10, y: self.bounds.height - 10))
        linePath.move(to: CGPoint(x: 9.5, y: 10))
        linePath.addLine(to: CGPoint(x: self.bounds.width - 9.5, y: 10))
        linePath.move(to: CGPoint(x: self.bounds.width - 10, y: 10))
        linePath.addLine(to: CGPoint(x: self.bounds.width - 10, y: self.bounds.height - 10))
        linePath.move(to: CGPoint(x: 9.5, y: self.bounds.height - 10))
        linePath.addLine(to: CGPoint(x: self.bounds.width - 9.5, y: self.bounds.height - 10))
        
        
        UIColor.darkGray.setStroke()
        linePath.lineWidth = 1
        linePath.stroke()
        
        
        //marking point
        let pointPath = UIBezierPath()
        
        pointPath.move(to: CGPoint(x: 30, y: 60))
        pointPath.addLine(to: CGPoint(x: 30, y: 70))
        
        pointPath.move(to: CGPoint(x: 30, y: 160))
        pointPath.addLine(to: CGPoint(x: 30, y: 170))
        
        pointPath.move(to: CGPoint(x: 30, y: 260))
        pointPath.addLine(to: CGPoint(x: 30, y: 270))
        
        pointPath.lineWidth = 10
        pointPath.stroke()
    }

}
