

import UIKit
import Firebase

class WriteViewController: UIViewController, UITextViewDelegate {
    
    var senderImg: UIImage?
    var postImgURLStr: String?
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.image = senderImg
        
    }
    
    
    @IBAction func postBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func postBtn(_ sender: UIButton) {
        guard let postText = postTextView.text else { return }
        guard let uploadData = UIImageJPEGRepresentation(senderImg!, 0.3) else { return }
        
        let date = String(describing: ServerValue.timestamp())
        print(date)
        
        Storage.storage().reference().child("post_images").child("date").putData(uploadData, metadata: nil) { (metadata, error) in
            if error != nil {
                print(error!)
            }else {
                DispatchQueue.main.async {
                    guard let profileImgUrl = metadata?.downloadURL()?.absoluteString else { return }
                    print(profileImgUrl)
                    self.postImgURLStr = profileImgUrl
                    let dic = ["user": InstaDatabase.main.user!, "content": postText,"images": self.postImgURLStr!] as [String: Any]
                    let postDic = Post(postsDic: dic)
                    InstaDatabase.main.posts.append(postDic!)
                    let uid = Auth.auth().currentUser?.uid
                    Database.database().reference().child(uid!).child("Posts").child("\(InstaDatabase.main.posts.count)").updateChildValues(dic)
                    
                    print(InstaDatabase.main.posts)
                }
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        
        if (textView.text == "내용을 입력해 주세요.")
        {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
}

