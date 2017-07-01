//
//  ExhibitionsModel.swift
//  GaleryStruct
//
//  Created by MacBook Air on 04.06.17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import Foundation

class ExhibitionsModel {
    
    let limit = 10
    var skip = 0
    
    private (set) var exhibitions:[ExibitionVO] = []
    static var instance: ExhibitionsModel = ExhibitionsModel()
    
    func loadExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestAllExhibitions(skip: skip, limit: limit, exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadNearMeExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestNearMeExhibitions(skip: skip, limit: limit, exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadPopularExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestPopularExhibitions(skip: skip, limit: limit, exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadLastChanceExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestLastChanceExhibitions(skip: skip, limit: limit, exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadOpeningExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestOpeningExhibitions(skip: skip, limit: limit, exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func setExhibitions(exhibitions: [ExibitionVO]) {
        self.exhibitions += exhibitions
    }
}
