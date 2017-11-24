
import UIKit
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Property List
    var ref: DatabaseReference!
    var userEmailValue: String = ""
    let uid = Auth.auth().currentUser?.uid
    var profileImgInFire: String?
    
    
    var profileUiView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cameraBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    var modifyProfileBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("프로필 수정", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var fullStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.layer.borderColor = UIColor.black.cgColor
        stackview.layer.borderWidth = 2
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.spacing = 10
        return stackview
    }()
    
    var postStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 5
        stackview.layer.borderColor = UIColor.black.cgColor
        stackview.layer.borderWidth = 1
        return stackview
    }()
    
    var postLabel: UILabel = {
        let lb = UILabel()
        lb.text = "게시물"
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.textAlignment = .center
        return lb
    }()
    
    var postNumber: UILabel = {
        let lb = UILabel()
        lb.text = "게시물 숫자"
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.textAlignment = .center
        return lb
    }()
    
    var followerStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 5
        stackview.layer.borderColor = UIColor.black.cgColor
        stackview.layer.borderWidth = 1
        return stackview
    }()
    
    var followerLabel: UILabel = {
        let lb = UILabel()
        lb.text = "팔로워"
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.textAlignment = .center
        return lb
    }()
    
    var followerNumber: UILabel = {
        let lb = UILabel()
        lb.text = "팔로워 숫자"
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.textAlignment = .center
        return lb
    }()
    
    var followingStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 5
        stackview.layer.borderColor = UIColor.black.cgColor
        stackview.layer.borderWidth = 1
        return stackview
    }()
    
    var followingLabel: UILabel = {
        let lb = UILabel()
        lb.text = "팔로잉"
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.textAlignment = .center
        return lb
    }()
    
    var followingNumber: UILabel = {
        let lb = UILabel()
        lb.text = "팔로잉 숫자"
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.textAlignment = .center
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarButtonSetup()
        self.view.backgroundColor = .white
        
        self.view.addSubview(profileUiView)
        //MARK : - profileUiView autolayout
        profileUiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileUiView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileUiView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileUiView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        profileUiView.addSubview(cameraBtn)
        //MARK : - cameraBtn autolayout
        cameraBtn.topAnchor.constraint(equalTo: profileUiView.topAnchor, constant: 20).isActive = true
        cameraBtn.leftAnchor.constraint(equalTo: profileUiView.leftAnchor, constant: 20).isActive = true
        cameraBtn.widthAnchor.constraint(equalTo: profileUiView.widthAnchor, multiplier: 0.2).isActive = true
        cameraBtn.heightAnchor.constraint(equalTo: cameraBtn.widthAnchor).isActive = true
        cameraBtn.setImage(UIImage(named: "deprofile"), for: .normal)
        view.layoutIfNeeded()
        cameraBtn.layer.cornerRadius = cameraBtn.frame.size.width / 2
        cameraBtn.clipsToBounds = true
        
        profileUiView.addSubview(idLabel)
        //MARK : - idlabel autolayout
        idLabel.topAnchor.constraint(equalTo: cameraBtn.bottomAnchor, constant: 10).isActive = true
        idLabel.leftAnchor.constraint(equalTo: cameraBtn.leftAnchor).isActive = true
        
        profileUiView.addSubview(fullStackView)
        //MARK : - fullstackview autolayout
        fullStackView.topAnchor.constraint(equalTo: cameraBtn.topAnchor).isActive = true
        fullStackView.leftAnchor.constraint(equalTo: cameraBtn.rightAnchor, constant: 20).isActive = true
        fullStackView.rightAnchor.constraint(equalTo: profileUiView.rightAnchor, constant: -20).isActive = true
        fullStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK: - posting StackView
        fullStackView.addArrangedSubview(postStackView)
        postStackView.addArrangedSubview(postNumber)
        postStackView.addArrangedSubview(postLabel)
        
        //MARK: - follower StackView
        fullStackView.addArrangedSubview(followerStackView)
        followerStackView.addArrangedSubview(followerNumber)
        followerStackView.addArrangedSubview(followerLabel)
        
        //MARK: - following StackView
        fullStackView.addArrangedSubview(followingStackView)
        followingStackView.addArrangedSubview(followingNumber)
        followingStackView.addArrangedSubview(followingLabel)
        
        profileUiView.addSubview(modifyProfileBtn)
        //MARK: - modifyProfileBtn AutoLayout
        modifyProfileBtn.topAnchor.constraint(equalTo: fullStackView.bottomAnchor, constant: 10).isActive = true
        modifyProfileBtn.centerXAnchor.constraint(equalTo: fullStackView.centerXAnchor).isActive = true
        modifyProfileBtn.widthAnchor.constraint(equalTo: fullStackView.widthAnchor).isActive = true
        modifyProfileBtn.heightAnchor.constraint(equalTo: fullStackView.heightAnchor).isActive = true
        
        //    MARK : - read data
//        ref = Database.database().reference()
//
//        DispatchQueue.global() .async {
//            self.ref.child(self.uid!).observeSingleEvent(of: .value) { (snapshot) in
//                if let value = snapshot.value as? NSDictionary {
//                    DispatchQueue.main.async {
//                        self.userEmailValue = value["user"] as! String
//                        self.idLabel.text = "\(self.userEmailValue)"
//                        self.idLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
//                        self.profileImgInFire = value["profileImgUrl"] as? String
//                        let imgURL = URL(string: self.profileImgInFire!)
//                        let data: Data = try! Data(contentsOf: imgURL!)
//                        self.cameraBtn.setImage(UIImage(data: data), for: .normal)
//                    }
//                }
//            }
//        }
        DispatchQueue.main.async {
            //MARK: - Get data in instaDatabase
            self.idLabel.text = InstaDatabase.main.username
            self.idLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
//            self.cameraBtn.setImage(UIImage(data: InstaDatabase.main.profileImgData!), for: .normal)
        }
        
        
        // MARK : - btn actions
        cameraBtn.addTarget(self, action: #selector(selectedProfileImg(_:)), for: .touchUpInside)
        modifyProfileBtn.addTarget(self, action: #selector(modifyBtnClicked(_:)), for: .touchUpInside)
    }
    
    @objc func modifyBtnClicked(_ sender: UIButton) {
        print("Clicked")
    }
    
    @objc func selectedProfileImg(_ sender: UIButton){
        let imgPicker = UIImagePickerController()
        imgPicker.allowsEditing = true
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    private func navigationBarButtonSetup() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(self.logoutBtn))
    }
    
    @objc func logoutBtn() {
        let alertSheet = UIAlertController(title: "로그아웃", message: "정말로 로그아웃 하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .default) { (action) in
            try! Auth.auth().signOut()
            let loginVC = LoginViewController()
            self.present(loginVC, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        alertSheet.addAction(okAction)
        alertSheet.addAction(cancelAction)
        present(alertSheet, animated: true, completion: nil)
    }
    
    // MARK : - ImgPickerView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            cameraBtn.setImage(img, for: .normal)
            guard let uploadData = UIImageJPEGRepresentation(img, 0.3) else { return }
            // Save imageData
            Storage.storage().reference().child("profile_images").child(uid!).putData(uploadData, metadata: nil, completion: { (metadata, error) in
                guard let userProfilephotoID = metadata?.downloadURL()?.absoluteString else { return }
                
                    InstaDatabase.main.profilePhotoID = userProfilephotoID
                Database.database().reference().child("users").child(self.uid!).updateChildValues(["userProfilephotoID": userProfilephotoID], withCompletionBlock: { (error, databaseRef) in
                    //finish
                })
            })
        }
        dismiss(animated: true, completion: nil)
    }
}

extension UIView
{
    // MARK: constraint메소드
    func constraint(targetView: UIView, topConstant: CGFloat?, bottomConstant: CGFloat?, leftConstant: CGFloat?, rightConstant: CGFloat? )
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        // 오토레이아웃 적용
        if let constant = topConstant{
            self.topAnchor.constraint(equalTo: targetView.topAnchor, constant: constant).isActive = true
        }
        if let constant = rightConstant{
            self.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: constant).isActive = true
        }
        if let constant = bottomConstant{
            self.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: constant).isActive = true
        }
        if let constant = leftConstant{
            self.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: constant).isActive = true
        }
    }
}

