//
//  FacebookManager.swift
//  GaleryStruct
//
//  Created by Pavlo Kharambura on 7/18/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON

class FacebookManager {
    static let shared = FBSDKLoginManager()
    
    public class func getUserData(completion: @escaping () -> Void) {
        if FBSDKAccessToken.current() != nil {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email, picture.type(normal)"]).start(completionHandler: { (connection, result, error) in
                if error == nil {
                    let json = JSON(result!)
                    print(json)
                    
                    User.currentUser.setUser(json)
                    completion()
                }
            })
        }
    }
}
