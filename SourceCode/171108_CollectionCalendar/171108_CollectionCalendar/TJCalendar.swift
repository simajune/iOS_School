
import UIKit

class TJCalendar: UIView {

    //MARK: - Property
    
    var month: Int?
    var year: Int?
    
    var isSelected: Bool = false
    var date: Date? {
        willSet {
            calendarData = TJCalendarDataModel(date: newValue!)
            year = calendarData?.year
            month = calendarData?.month
            contentsView.reloadData()
        }
    }
    
    private var calendarData: TJCalendarDataModel?
    
    private var contentsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectioView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        
        //콜렉션 뷰의 속성 추가 가능
        collectioView.backgroundColor = .clear
        return collectioView
    }()
    
    //MARK: - Init
    override func awakeFromNib() {
        setupUI()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    
    
    
    //MARK: - SetupUI
    //UI 관련 setup이 필요한 경우
    private func setupUI() {
        self.addSubview(contentsView)
        contentsView.delegate = self
        contentsView.dataSource = self
        contentsView.register(CustomCell.self, forCellWithReuseIdentifier: cellIdnetifier)
        updateLayout()
    }
    let cellIdnetifier = "cell"
    
    private func updateLayout() {
        contentsView.constraint(targetView: self, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0)
    }
    
    func updateNextMonth() {
        date = TJCalendarManager.nextMonth(with: calendarData!)
    }
    
    func updatePrevMonth() {
        date = TJCalendarManager.prevMonth(with: calendarData!)
    }
    
}
//MARK: - Extension Delegate, DataSource
extension TJCalendar: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UICollectioViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 7
        if indexPath.section == 0 {
            return CGSize(width: width, height: 30)
        }else {
            return CGSize(width: collectionView.frame.size.width / 7, height: collectionView.frame.size.width / 7)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - UICollectioViewDataSource
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }else {
            if let calendarData = calendarData {
                return calendarData.endDayOfMonth + calendarData.startWeekOfMonth.rawValue
            }else {
                return 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdnetifier, for: indexPath) as! CustomCell
        cell.initUI()
        if indexPath.section == 0 {
            cell.titleLb.text = WeekDay(rawValue: indexPath.item)?.name
            cell.selectedView.isHidden = true
        }else {
            let changeIndex = indexPath.item - calendarData!.startWeekOfMonth.rawValue
            if changeIndex >= 0  && changeIndex < (calendarData?.endDayOfMonth)! {
                let day = changeIndex  + 1
                cell.titleLb.text = "\(day)"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        
        if indexPath.section == 1{
            if isSelected{
                cell.selectedView.isHidden = true
                isSelected = false
            }else{
                cell.selectedView.isHidden = false
                isSelected = true
            }
        }
        
    }
}

class CustomCell: UICollectionViewCell {
    
    var titleLb: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = .white
        
        return lb
    }()
    
    var selectedView: UIView = {
        let selectView = UIView()
        
       return selectView
    }()
    
    
    func initUI() {
        titleLb.text = ""
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - SetupUI
    //UI 관련 setup이 필요한 경우
    private func setupUI() {
        self.addSubview(selectedView)
        self.selectedView.backgroundColor = .clear
        self.selectedView.layer.cornerRadius = (self.frame.size.width - 10) / 2
        self.selectedView.layer.borderColor = UIColor.white.cgColor
        self.selectedView.layer.borderWidth = 3
        self.selectedView.isHidden = true
        self.addSubview(titleLb)
        self.backgroundColor = .clear
        updateLayout()
    }
    
    private func updateLayout() {
        selectedView.constraint(targetView: self, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0)
        titleLb.constraint(targetView: self, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0)
    }
}

extension UIView {
    func constraint(targetView: UIView, topConstant: CGFloat?, leftConstant: CGFloat?, rightConstant: CGFloat?, bottomConstant: CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = topConstant {
            self.topAnchor.constraint(equalTo: targetView.topAnchor, constant: top).isActive = true
        }
        if let left = leftConstant {
            self.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: left).isActive = true
        }
        if let right = rightConstant {
            self.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: right).isActive = true
        }
        if let bottom = bottomConstant {
            self.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: bottom).isActive
             = true
        }
    }
    
    func constraint(targetView: UIView, widthConstant: CGFloat?, heightConstant: CGFloat?) {
        
    }
}








