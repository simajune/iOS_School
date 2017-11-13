
import UIKit

class DetailViewController: UIViewController {

    var indexNumber: Int = 0
    var contents: [String] = []
    var imageDatas: [Data] = []
    @IBOutlet weak var contentsImage: UIImageView!
    @IBOutlet weak var contentsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        contents = UserDefaults.standard.object(forKey: "contents") as? [String] ?? []
        imageDatas = UserDefaults.standard.object(forKey: "Image") as? [Data] ?? []
        indexNumber = UserDefaults.standard.integer(forKey: "indexNumber")
        
        contentsText.text = contents[indexNumber]
        contentsImage.image = UIImage(data: imageDatas[indexNumber])
    }
}
