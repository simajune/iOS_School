
import UIKit

class MainViewController: UIViewController {

    //MARK: - Property
    var dateFormatter: DateFormatter = DateFormatter()
    
    //MARK: - IBOutlet
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatSetting()
    }
    
    //데이트 셋팅 (결과 값은 년,월,일을 보여주기 위해 포맷 세팅을 해줌)
    private func dateFormatSetting() {
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
    }
    
    //MARK: - IBAction
    @IBAction func confirmBtnAction(_ sender: UIButton) {
        //입력된 값이 숫자가 아니면 출력이 안되게 함
        if let monthNum = Int(monthTextField.text!) {
            let resultDate = datePicker.calendar.date(byAdding: .month, value: -1*(monthNum), to: datePicker.date)
            resultLabel.text = dateFormatter.string(from: resultDate!)
        } else {
            UIAlertController.presentAlertController(target: self, title: nil, massage: "숫자를 입력해주세요.", cancelBtn: false, completion: nil)
        }
    }
}

//MARK: - UIAlertCotroller
extension UIAlertController {
    
    //알림창
    static func presentAlertController(target: UIViewController,
                                       title: String?,
                                       massage: String?,
                                       actionStyle: UIAlertActionStyle = UIAlertActionStyle.default,
                                       cancelBtn: Bool,
                                       completion: ((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: actionStyle, handler: completion)
        alert.addAction(okAction)
        if cancelBtn {
            let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
            alert.addAction(cancelAction)
        }
        target.present(alert, animated: true, completion: nil)
    }
}
