//
//  alamofireDownloadJSON.swift
//  GaleryStruct
//
//  Created by MacBook Air on 23.06.17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import Foundation
import SDWebImage
import Alamofire
import AlamofireObjectMapper


class Sender {
    

    func requestAllExhibitions(skip: Int, limit: Int, exhibitionsLoaded:@escaping () -> Void) {
        let params = [
            "skip" : skip,
            "limit" : limit
        ]
        
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions", parameters: params).responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestOpeningExhibitions(skip: Int, limit: Int, exhibitionsLoaded:@escaping () -> Void) {
        let params = [
            "skip" : skip,
            "limit" : limit
        ]
        
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/opening", parameters: params).responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestLastChanceExhibitions(skip: Int, limit: Int, exhibitionsLoaded:@escaping () -> Void) {
        let params = [
            "skip" : skip,
            "limit" : limit
        ]
        
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/lastchance", parameters: params).responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestPopularExhibitions(skip: Int, limit: Int, exhibitionsLoaded:@escaping () -> Void) {
        let params = [
            "skip" : skip,
            "limit" : limit
        ]
        
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/popular", parameters: params).responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestNearMeExhibitions(skip: Int, limit: Int, exhibitionsLoaded:@escaping () -> Void) {
        let params = [
            "skip" : skip,
            "limit" : limit
        ]
        
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/near", parameters: params).responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
