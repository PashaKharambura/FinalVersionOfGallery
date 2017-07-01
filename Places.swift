import Foundation

class Place {
    var adress: Adress
    var website: URL?
    var phoneNumber: String?
    var contactPerson: Person
    var details: String
    var logotip: URL?
    var titleName: String
    var events: [Event]
    
    init(titleName: String, details: String, adress: Adress, website: URL?, contactPerson: Person, logotip:URL?, phoneNumber: String?, events: Array<Event>) {
        self.titleName = titleName
        self.details = details
        self.adress = adress
        self.contactPerson = contactPerson
        self.logotip = logotip
        self.phoneNumber = phoneNumber
        self.website = website
        self.events = events
    }
}

class Gallery: Place {
    var exibitions: [Exibition] = []
}

class ConcertAndTheatre: Place {
    var concertTheatre: [Event] = []
}
