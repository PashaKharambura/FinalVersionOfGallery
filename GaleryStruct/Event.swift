import Foundation

let threeHours = 10800.0
let oneWeek = 604800.0
let oneMonth = 2592000.0
let date = NSDate()
let currentInterval = date.timeIntervalSince1970 + threeHours

class Event: SearchMethods {
    var title: String
    var startDate: Date
    var endDate: Date?
    var author: Person?
    var details: String?
    
    init(title: String, startDate: Date, endDate: Date, author: Person?, details: String?) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.author = author
        self.details = details
    }
    
    func OpenedEvent(mass: [Event]) -> [Event] {
        var opened: [Event] = []
        for event in mass {
            if (event.endDate != nil) {
                if ((currentInterval - event.startDate.timeIntervalSince1970) > 0 && (event.endDate?.timeIntervalSince1970)! - currentInterval > 0 ) {
                    opened.append(event)
                }
            }
        }
        return opened
    }
    
    func ClosingEvent(mass: [Event]) -> [Event] {
        var closing: [Event] = []
        for event in mass {
            if (event.endDate != nil) {
                if ( currentInterval - event.startDate.timeIntervalSince1970 > 0 && (event.endDate?.timeIntervalSince1970)! - currentInterval < oneWeek ) {
                    closing.append(event)
                }
            }
        }
        return closing
    }
    
    func WillBeOpenedEvent(mass: [Event]) -> [Event] {
        var willBeOpened: [Event] = []
        for event in mass {
            if (event.endDate != nil) {
                if ((event.endDate?.timeIntervalSince1970)! - currentInterval < oneMonth) {
                    willBeOpened.append(event)
                }
            }
        }
        return willBeOpened
    }
}

class Exibition: Event {
    var works: [Picture] = []
}

class Concert: Event {
    var artists: [Person] = []
}

class Theatre: Event {
    var artists: [Person] = []
}
