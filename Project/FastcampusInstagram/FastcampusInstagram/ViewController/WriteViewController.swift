

import UIKit
import Firebase

class WriteViewController: UIViewController, UITextViewDelegate {
    
    var senderImg: UIImage?
    var photoID: String?
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
        
        //let date = String(describing: ServerValue.timestamp())
        let uuid = UUID().uuidString
        Storage.storage().reference().child("post_images").child(uuid).putData(uploadData, metadata: nil) { (metadata, error) in
            if error != nil {
                print(error!)
            }else {
                DispatchQueue.main.async {
                    guard let photoID = metadata?.downloadURL()?.absoluteString else { return }
                    print(photoID)
                    self.photoID = photoID
                    let dic = ["username": InstaDatabase.main.username!, "content": postText, "postPhotoID": self.photoID!, "date": ServerValue.timestamp()] as [String: Any]
//                    print(dic)
//                    let postDic = Post(with: dic)
//                    print(postDic)
//                    InstaDatabase.main.posts.append(postDic!)
                    let uid = Auth.auth().currentUser?.uid
                    let key = Database.database().reference().child("posts").childByAutoId().key
                    let childUpdates = ["/posts/\(key)": dic,
                                        "/user-posts/\(uid!)/\(key)/": dic]
                    Database.database().reference().updateChildValues(childUpdates)
                    //Database.database().reference().child("posts").child(uuid).updateChildValues(dic)
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

