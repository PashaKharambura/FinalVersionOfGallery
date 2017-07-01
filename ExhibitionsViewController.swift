//
//  ExhibitionsViewController.swift
//  GaleryStruct
//
//  Created by MacBook Air on 22.06.17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ExhibitionsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var blurView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nearMeButton: UIButton!
    @IBOutlet weak var nearMe: UIButton!
    @IBOutlet weak var mostPopular: UIButton!
    @IBOutlet weak var opening: UIButton!
    @IBOutlet weak var lastChance: UIButton!
    @IBOutlet weak var following: UIButton!
    
    var worksArr: [String:WorksVO] = [:]
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExhibitionsModel.instance.loadExhibitions(exhibitionsLoaded: tableView.reloadData)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        effect = visualEffectView.effect
        visualEffectView.effect = nil
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { // когда создавать а когда оверрайдить переменную
        return .lightContent
    }
    
    func addView() {
        self.view.addSubview(blurView)
        blurView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.effect = self.effect
            self.blurView.alpha = 1
            self.blurView.transform = CGAffineTransform.identity
        }
    }
    
    func closeView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.blurView.alpha = 0
            self.visualEffectView.effect = nil
        }) { (sucsess: Bool) in
            self.blurView.removeFromSuperview()
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showNearMe(_ sender: UIButton) {
        ExhibitionsModel.instance.loadNearMeExhibitions(exhibitionsLoaded: closeView)
    }
  
    @IBAction func showPopular(_ sender: UIButton) {
        ExhibitionsModel.instance.loadPopularExhibitions(exhibitionsLoaded: closeView)
    }
    @IBAction func showOpening(_ sender: UIButton) {
        ExhibitionsModel.instance.loadOpeningExhibitions(exhibitionsLoaded: closeView)
        
    }
    @IBAction func showLastChance(_ sender: UIButton) {
        ExhibitionsModel.instance.loadLastChanceExhibitions(exhibitionsLoaded: closeView)
    }
    @IBAction func showAll(_ sender: UIButton) {
        ExhibitionsModel.instance.loadExhibitions(exhibitionsLoaded: closeView)
    }
    
    @IBAction func showButton(_ sender: UIButton) {
        addView()
        tableView.isScrollEnabled = false
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        closeView()
        tableView.isScrollEnabled = true
    }    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExhibitionsModel.instance.exhibitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as! ExhibitTableViewCell
        let exhibitions = ExhibitionsModel.instance.exhibitions[indexPath.row]
       
        if let workURL = exhibitions.works?.first?.imgPicture?.url {
            cell.titleImage.sd_setImage(with: URL(string: workURL), completed: { (_, er, _, url) in
                if let someError = er {
                    print("\(#function) error in downloading picture = \(someError.localizedDescription) for url = \(String(describing: url))")
                }
            })
        } else {
            cell.titleImage.image = UIImage(named: "notAviable")
        }
        cell.titleLabel?.text = exhibitions.name
        cell.titleLabel?.textColor = UIColor.white
        cell.titleLabel?.font = cell.titleLabel?.font.withSize(22)
        cell.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        cell.authourLabel.text = exhibitions.authourName
        cell.placeLabel.text = exhibitions.gallery?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let exhibitions = ExhibitionsModel.instance.exhibitions
        let lastExhibitionRow = exhibitions.count - 1
        if indexPath.row == lastExhibitionRow {
            ExhibitionsModel.instance.skip += 10
            ExhibitionsModel.instance.loadExhibitions(exhibitionsLoaded: tableView.reloadData)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let index = tableView.indexPath(for: cell)!
        let exhibition = ExhibitionsModel.instance.exhibitions[index.row]
        let destination = segue.destination as! ExhibitionsDetailsViewController
        destination.exhibitionData = exhibition
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let scale: CGFloat = 0.4
        return self.view.frame.size.height * scale
    }
}
