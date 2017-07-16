import Foundation
import ObjectMapper
import MapKit

struct GalleryVO {
    var id:String!
    var name: String!
    var galleryDescript:String?
    var email: String?
    var facebook: String?
    var city: String?
    var address: String?
    var galleryLogo: URL?
    var link: String?
    var phone: String?
    var latitude: NSString?
    var longitude: NSString?
    var schedule: [String]?
}

extension GalleryVO: Mappable {
   
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["objectId"]
        name <- map["name"]
        galleryDescript <- map["galleryDescription"]
        email <- map["email"]
        facebook <- map["facebook"]
        city <- map["city"]
        schedule <- map["schedule"]
        address <- map["address"]
        galleryLogo <- map["galleryLogo"]
        link <- map["link"]
        phone <- map["phone"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
