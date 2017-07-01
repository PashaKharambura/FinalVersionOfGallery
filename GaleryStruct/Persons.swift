import Foundation

class Person {
    var name: String
    var email: String?
    
    init(name: String, email: String?) {
        self.name = name
        self.email = email
        
    }
}

class Author: Person {
    var works: [Picture] = []
}

