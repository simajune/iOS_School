
import Foundation

enum WeekDay: Int {
    case Sun = 0, Mon, Tue, Wed, Thu, Fri, Sat
    
    var name: String {
        switch self {
        case .Sun:
            return "Sun"
        case .Mon:
            return "Mon"
        case .Tue:
            return "Tue"
        case .Wed:
            return "Wed"
        case .Thu:
            return "Thu"
        case .Fri:
            return "Fri"
        case .Sat:
            return "Sat"
        }
    }
}

class TJCalendarManager {
    class func nextMonth(with dataModel: TJCalendarDataModel) -> Date {
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newComponents = DateComponents()
        newComponents.year = dataModel.year
        newComponents.month = dataModel.month + 1
        
        if let nextDate = calendarIns.date(from: newComponents) {
            return nextDate
        }else {
            return Date()
        }
    }
    
    class func prevMonth(with dataModel: TJCalendarDataModel) -> Date?{
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newComponents = DateComponents()
        newComponents.year = dataModel.year
        newComponents.month = dataModel.month - 1
        
        if let nextDate = calendarIns.date(from: newComponents) {
            return nextDate
        }else {
            return Date()
        }
    }
    
//    class func previousMonth(with newData: Date) -> Date?{
//        let calendatIns = Calendar(identifier: .gregorian)
//        var addComponents = DateComponents()
//        addComponents.month = -1
//        
//        guard let newData = calendatIns.date(byAdding: addComponents, to: newData) { return nil }
//        return newData
//    }
    
}


struct TJCalendarDataModel {
    
    var year: Int
    var month: Int
    var day: Int
    
    var startWeekOfMonth: WeekDay
    var endDayOfMonth: Int
    
    init?(date: Date){
        
        let calendarIns = Calendar(identifier: .gregorian)
        
        //잘 돌아간다
        var components = calendarIns.dateComponents([.year, .month], from: date)
        year = components.year ?? 0
        month = components.month ?? 0
        day = components.day ?? 0 
        
        guard let firstDayaDate = calendarIns.date(from: components) else  { return nil }
        let weekDayCompo = calendarIns.dateComponents([.weekday], from: firstDayaDate)
        
        startWeekOfMonth = WeekDay.init(rawValue: weekDayCompo.weekday! - 1)!
        
        var addComponents = DateComponents()
        addComponents.month = 1
        addComponents.day = -1
        
        guard let lastDayDate = calendarIns.date(byAdding: addComponents, to: firstDayaDate) else { return nil }
        endDayOfMonth = calendarIns.dateComponents([.day], from: lastDayDate).day ?? 1
    }
}
