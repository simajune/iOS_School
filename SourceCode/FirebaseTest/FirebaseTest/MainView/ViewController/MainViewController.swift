
import UIKit
import Firebase
import JTAppleCalendar

class MainViewController: UIViewController {
    
    let formater = DateFormatter()
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var yearLb: UILabel!
    @IBOutlet weak var monthLb: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    let outsideMonthColor = UIColor(red: 88.0/255.0, green: 74.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    let monthColor = UIColor.white
    let selectedMonthColor = UIColor(red: 58.0/255.0, green: 41.0/255.0, blue: 75.0/255.0, alpha: 1.0)
    let currentDateSelectedViewColor = UIColor(red: 78.0/255.0, green: 63.0/255.0, blue: 93.0/255.0, alpha: 1.0)
//    var ref = DatabaseReference.init()
    var ref: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("user").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            print("username:",username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        print("viewdidload")
        
        self.ref = Database.database().reference()
        
        setupCalendarView()
    }
    
    func setupCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        calendarView.visibleDates { (visibleDates) in
            let date = visibleDates.monthDates.first!.date
            
            self.formater.dateFormat = "yyyy"
            self.yearLb.text = self.formater.string(from: date)
            
            self.formater.dateFormat = "MMMM"
            self.monthLb.text = self.formater.string(from: date)
            
            self.addButton.layer.cornerRadius = self.addButton.frame.width / 2
            self.addButton.clipsToBounds = true
        }
    }
    
    func handleCellTextColor(cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        if validCell.isSelected {
            validCell.dateLb.textColor = selectedMonthColor
        }else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLb.textColor = monthColor
            }else {
                validCell.dateLb.textColor = outsideMonthColor
            }
        }
    }

    func handleCellSelected(cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        }else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func setupViewOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formater.dateFormat = "yyyy"
        self.yearLb.text = self.formater.string(from: date)
        
        self.formater.dateFormat = "MMMM"
        self.monthLb.text = self.formater.string(from: date)
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        try! Auth.auth().signOut()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = mainStoryBoard.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController{
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    @IBAction func addButtonAction(_ sender: UIButton) {
        self.ref.child("user").setValue("sima")
        
    }
    
}


extension MainViewController:  JTAppleCalendarViewDataSource {

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formater.dateFormat = "yyyy MM dd"
        formater.timeZone = Calendar.current.timeZone
        formater.locale = Calendar.current.locale
        
        let startDate = formater.date(from: "2017 01 01")!
        let endDate = formater.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}

extension MainViewController: JTAppleCalendarViewDelegate {
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(cell: cell, cellState: cellState)
        handleCellTextColor(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(cell: cell, cellState: cellState)
        handleCellTextColor(cell: cell, cellState: cellState)
    }

    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLb.text = cellState.text
        handleCellSelected(cell: cell, cellState: cellState)
        handleCellTextColor(cell: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewOfCalendar(from: visibleDates)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: self.view.frame.width / 7, height: 30)
        return cellSize
    }
}
//extension UIColor{
//    convenience init(colorWithHexValue Int: Int, alpha: CGFloat = 1.0) {
//        self.init(
//            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(value & 0x0000FF) / 255.0,
//            alpha: alpha
//            )
//    }
//}

