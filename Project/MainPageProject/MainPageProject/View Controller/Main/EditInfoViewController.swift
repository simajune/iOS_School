
import UIKit

class EditInfoViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - VAriable
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileBGImg: UIImageView!
    @IBOutlet weak var profileBGButton: UIButton!
    @IBOutlet weak var profileMainImg: UIImageView!
    @IBOutlet weak var profileMainButton: UIButton!
    
    @IBOutlet weak var idTextField: CustomTextField!
    @IBOutlet weak var nicknameTextField: CustomTextField!
    @IBOutlet weak var statusTextField: CustomTextField!
    @IBOutlet weak var birthDayTextField: CustomTextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    
    //MARK: - TextField Delegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touchesBegan")
        self.view.endEditing(true)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("asd")
//        return true
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        profileMainImg.clipsToBounds = true
        
    }
    
    //MARK: - Notification
    @objc func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        print("0")
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    
    //MARK: - Create UI
    
    private func createUI() {
        profileBGImg.layer.borderColor = UIColor.white.cgColor
        profileBGImg.layer.borderWidth = 1
        
        profileMainImg.layer.cornerRadius = profileMainImg.frame.size.height / 2
        profileMainImg.layer.borderColor = UIColor.white.cgColor
        profileMainImg.layer.borderWidth = 1
        
        idTextField.text = UserDefaults.standard.object(forKey: "username") as? String
        
        nicknameTextField.configureAttributedString(string: "닉네임을 입력해주세요", range: NSRange(location: 0, length: 3), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        statusTextField.configureAttributedString(string: "상태를 입력해주세요", range: NSRange(location: 0, length: 2), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        birthDayTextField.configureAttributedString(string: "생년월일을 입력해주세요", range: NSRange(location: 0, length: 4), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        phoneTextField.configureAttributedString(string: "핸드폰 번호를 입력해주세요", range: NSRange(location: 0, length: 6), stringColor: UIColor.red.withAlphaComponent(0.5))
        
        emailTextField.text = UserDefaults.standard.object(forKey: "userEmail") as? String
    }
    
    //MARK: - UIButton Acion
    @IBAction func profileBGButton(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "사진 선택", message: "사진을 골라주세요", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let cameraAction = UIAlertAction(title: "카메라", style: .default) { (action) in
                let imgPicker = UIImagePickerController()
                imgPicker.sourceType = .camera
                imgPicker.delegate = self
                self.present(imgPicker, animated: true, completion: nil)
            }
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(cancelAction)
        }
        let photoAction = UIAlertAction(title: "사진", style: .default) { (action) in
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = .photoLibrary
            imgPicker.delegate = self
            self.present(imgPicker, animated: true, completion: nil)
        }
        actionSheet.addAction(photoAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func profileMainButton(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "사진 선택", message: "사진을 골라주세요", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let cameraAction = UIAlertAction(title: "카메라", style: .default) { (action) in
                let imgPicker = UIImagePickerController()
                imgPicker.sourceType = .camera
                imgPicker.delegate = self
                self.present(imgPicker, animated: true, completion: nil)
            }
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(cancelAction)
        }
        let photoAction = UIAlertAction(title: "사진", style: .default) { (action) in
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = .photoLibrary
            imgPicker.delegate = self
            self.present(imgPicker, animated: true, completion: nil)
        }
        actionSheet.addAction(photoAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        if let url = info[UIImagePickerControllerImageURL] as? URL
        {
            if let data = try? Data(contentsOf: url)
            {
                profileBGImg.image = UIImage(data: data)
                profileMainImg.image = UIImage(data: data)
                
                UserDefaults.standard.set(data, forKey: "profileImgData")
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Extension
//extension EditInfoViewController: UITextFieldDelegate {
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //print("touchesBegan")
//        self.view.endEditing(true)
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesMoved")
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesEnded")
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        /*print("textFieldShouldReturn")
//         nameTextField.resignFirstResponder()
//         idTextField.resignFirstResponder()
//         passwordTextField.resignFirstResponder()
//         telTextField.resignFirstResponder()
//         blogTextField.resignFirstResponder()*/
//        textField.resignFirstResponder()
//        
//        return true
//    }
//    
//}

