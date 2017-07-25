//
//  File.swift
//  GaleryStruct
//
//  Created by Pavlo Kharambura on 7/17/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import Foundation
import MapKit

class GalleryMapPoint: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate

        super.init()
    }
}
