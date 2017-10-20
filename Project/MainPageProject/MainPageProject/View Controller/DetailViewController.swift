
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLb: UILabel!
    @IBOutlet weak var descriptionLb: UITextView!
    @IBOutlet weak var phoneLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    
    var data: MemberData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let real = data {
            self.bgImageView.image = UIImage(named: real.backgroundImage)
            self.profileImageView.image = UIImage(named: real.profileImage)
            self.nicknameLb.text = real.nickname
            self.descriptionLb.text = real.myProfileDescription
            self.phoneLb.text = real.phoneNumber
            self.emailLb.text = real.email  
        }
        
        self.navigationController?.navigationBar.tintColor = .black
        bgImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = true

    }


}
