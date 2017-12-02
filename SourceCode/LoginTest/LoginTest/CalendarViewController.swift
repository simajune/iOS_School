
import UIKit
import CVCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var kakaoBtn: KOLoginButton!
    @IBOutlet weak var calendarView: CVCalendarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func kakaoAction(_ sender: Any) {
        let session :KOSession = KOSession.shared()
        if session.isOpen() {
            session.close()
        }
        session.presentingViewController = self
        session.open(completionHandler: {(error) -> Void in
            // 카카오 로그인 화면에서 벋어날 시 호출됨. (취소일 때도 표시됨)
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else if session.isOpen() {
                KOSessionTask.meTask(completionHandler: {(profile, error) -> Void in
                    if profile != nil {
                        DispatchQueue.main.async(execute: { () -> Void in
                            let kakao : KOUser = profile as! KOUser
                            print(kakao.properties)
                            
                            print(kakao.id)
                            print(kakao.email)
                        })
                    }
                })
            }
        })
    }
}
