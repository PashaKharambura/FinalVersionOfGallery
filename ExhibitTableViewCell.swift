//
//  ExhibitTableViewCell.swift
//  GaleryStruct
//
//  Created by MacBook Air on 21.06.17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit

class ExhibitTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var authourLabel: UILabel! {
        didSet {
            authourLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
