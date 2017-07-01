import Foundation
import ObjectMapper

struct ExibitionVO {
    var id: String?
    var authourName: String?
    var name: String?
    var createdAt: Date?
    var updatedAt: Date?
    var authourDeskript: String?
    var startDate: MyDate?
    var endDate: MyDate?
    var details: String?
    var gallery: GalleryVO?
    var works: [WorksVO]?

}

extension ExibitionVO: Mappable {
 
    init?(map: Map) {
        
    }

    mutating func mapping(map: Map) {
        id <- map["objectId"]
        authourName <- map["authorName"]
        name <- map["name"]
        details <- map["about"]
        authourDeskript <- map["authorDescription"]
        startDate <- map["dateStart"]
        endDate <- map["dateEnd"]
        gallery <- map["gallery"]
        works <- map["works"]
    }
}


struct MyDate: Mappable {
    
    var iso: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        iso <- map["iso"]
    }
    
    
}
