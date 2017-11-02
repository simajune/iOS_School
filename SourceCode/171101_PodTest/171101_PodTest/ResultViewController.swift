
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



/**
 Extend array to enable random shuffling
 */
extension Array {
    /**
     Randomizes the order of an array's elements
     */
    mutating func shuffle() {
        for _ in 0..<count {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

import UIKit
import ViewAnimator
class ResultViewController: UIViewController {

    var firstnum: CGFloat = 0
    var secondnum: CGFloat = 0
    var thirdnum: CGFloat = 0
    var fourthnum: CGFloat = 0
    
    var ratio: Float = 0
    
    var array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    @IBOutlet weak var firstHeight: NSLayoutConstraint!
    @IBOutlet weak var secondHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdHeight: NSLayoutConstraint!
    @IBOutlet weak var fourthHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var count = array.count
        
        print(array)
        array.shuffle()
        print(array)
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0) {
            self.firstHeight = self.firstHeight.changeMultiplier(changeMultiplier: self.firstnum/10)
            self.secondHeight = self.secondHeight.changeMultiplier(changeMultiplier: self.secondnum/10)
            self.thirdHeight = self.thirdHeight.changeMultiplier(changeMultiplier: self.thirdnum/10)
            self.fourthHeight = self.fourthHeight.changeMultiplier(changeMultiplier: self.fourthnum/10)
            self.view.layoutIfNeeded()
        }
    }

}
