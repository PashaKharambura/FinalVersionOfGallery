//
//  WorkDetailsViewController.swift
//  GaleryStruct
//
//  Created by Pavlo Kharambura on 6/30/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit
import SDWebImage

class WorkDetailsViewController: UIViewController {
    @IBOutlet weak var workImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    public var work = WorksVO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorLabel.text = work.author
        year.text = work.year
        typeLabel.text = work.type
        sizeLabel.text = work.size
        titleLabel.text = work.title
        if let workUrl = work.imgPicture?.url {
        workImage.sd_setImage(with: URL(string: workUrl))
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { 
        return .lightContent
    }

    
}
