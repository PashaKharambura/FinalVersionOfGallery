//
//  ClientMenuTableViewController.swift
//  GaleryStruct
//
//  Created by Pavlo Kharambura on 7/18/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit

class ClientMenuTableViewController: UITableViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = User.currentUser.name
        avatarImage.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureURL!)!))
        avatarImage.layer.cornerRadius = 70/2
        avatarImage.layer.borderWidth = 1.0
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderColor = UIColor.white.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClientLogout" {
            FacebookManager.shared.logOut()
            User.currentUser.resetUser()
            
        }
    }

}
