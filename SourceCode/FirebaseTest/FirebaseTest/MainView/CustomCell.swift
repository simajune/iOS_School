
import UIKit
import JTAppleCalendar


class CustomCell: JTAppleCell {
    
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}
