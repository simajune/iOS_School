

import UIKit
// 알림창

struct Alert
{
    static func showAlertController(title: String,
                                    message: String?,
                                    actionStyle: UIAlertActionStyle = UIAlertActionStyle.default,
                                    cancelButton: Bool,
                                    complition: ((UIAlertAction) -> Void)?
        ) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: actionStyle, handler: complition)
         alert.addAction(okAction)
        if cancelButton == true
        {
            // style을 매개변수와 연결하지 않은 이유:
            // 매개변수에 의해 똑같은 색으로 바뀌므로
             let cancleAction = UIAlertAction(title: "취소", style: .default, handler: nil)
             alert.addAction(cancleAction)
        }
       
       
       
        
        return alert
    }
}
