
import UIKit

class ContentsViewController: UIViewController {

    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var contentsImgView: UIImageView!
    
    var contents: [String] = []
    var datas: [Data] = []
    var dataItem: Data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        contents = UserDefaults.standard.object(forKey: "contents") as? [String] ?? []
        datas = UserDefaults.standard.object(forKey: "Image") as? [Data] ?? []
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        guard let currentContents = contentsTextView.text else { return }
        if contentsImgView.image != nil {
            contents.insert(currentContents, at: 0)
            datas.insert(dataItem, at: 0)
            UserDefaults.standard.set(datas, forKey: "Image")
            UserDefaults.standard.set(contents, forKey: "contents")
            self.navigationController?.popViewController(animated: true)
        }else {
            contents.insert(currentContents, at: 0)
            datas.insert(Data(), at: 0)
            UserDefaults.standard.set(datas, forKey: "Image")
            UserDefaults.standard.set(contents, forKey: "contents")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func imagePickerButton(_ sender: UIButton) {
        camera()
    }
    
    
}

extension ContentsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let url = info[UIImagePickerControllerImageURL] as? URL {
            print(url)
            if let data = try? Data(contentsOf: url) {
                dataItem = data
                contentsImgView.image = UIImage(data: data)
                
                
            }
            dismiss(animated: true, completion: nil)
        }
    }
    
    func camera() {
        let alertSheet = UIAlertController(title: "사진", message: "사진을 올려주세요", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "찍기", style: .default) { (action) in
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = .camera
                cameraPicker.delegate = self
                self.present(cameraPicker, animated: true, completion: nil)
            }
            alertSheet.addAction(cameraAction)
        }
        
        let photoAction = UIAlertAction(title: "앨범", style: .default) { (action) in
            let photoPicker = UIImagePickerController()
            photoPicker.sourceType = .photoLibrary
            photoPicker.delegate = self
            self.present(photoPicker, animated: true, completion: nil)
        }
        alertSheet.addAction(photoAction)
        alertSheet.addAction(cancelAction)
        present(alertSheet, animated: true, completion: nil)
        
    }
}
