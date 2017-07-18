//
//  LoadingViewController.swift
//  GaleryStruct
//
//  Created by MacBook Air on 04.06.17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoadingViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var connectingButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var loginFacebook: UIButton!
    @IBOutlet weak var logoutFacebook: UIButton!
    
    
    var loginSuccessful = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.current() != nil {
            logoutFacebook.isHidden = false
            FacebookManager.getUserData(completion: { 
                self.loginFacebook.setTitle("Continiue as \(String(describing: User.currentUser.name!))", for: .normal)
               // self.logoutFacebook.setTitle("Log out \(String(describing: User.currentUser.name!))", for: .normal)
            })
        } else {
            logoutFacebook.isHidden = true
        }
        
        slideScrollView.delegate = self
        connectingButton.layer.cornerRadius = 10
        let slides:[Slide] = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }

    @IBAction func facebookLogoutButton(_ sender: UIButton) {
        FacebookManager.shared.logOut()
        User.currentUser.resetUser()
       logoutFacebook.isHidden = true
        loginFacebook.setTitle("Login with Facebook", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && loginSuccessful == true) {
            performSegue(withIdentifier: "ClientView", sender: self)
        }
    }
    
    @IBAction func fbLoginButon(_ sender: UIButton) {
        if FBSDKAccessToken.current() != nil {
            self.loginSuccessful = true
            self.viewDidAppear(true)
        } else {
            FacebookManager.shared.logIn(withReadPermissions: ["public_profile", "email"], from: self, handler: { (result, error) in
                if error == nil {
                    FacebookManager.getUserData(completion: { 
                        self.loginSuccessful = true
                        self.viewDidAppear(true)
                    })
                    
                }
            })
        }
    self.logoutFacebook.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createSlides() -> [Slide] {
        let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.label.text = "Gallery Guru is your personalised guide to art galleries"
        slide1.image.image = UIImage(named: "Picture1")
        
        let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.label.text = "Explore galleries and exhibitions around you"
        slide2.image.image = UIImage(named: "Picture2")
        
        let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.label.text = "Stay updated and follow galleries you like"
        slide3.imageSlideThree.image = UIImage(named: "big_heart")
        slide3.image.image = UIImage(named: "Picture3")
        
        return [slide1,slide2,slide3]
    }
    
    func setupSlideScrollView(slides:[Slide]) {
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.6)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height*0.6)

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height*0.6)
            slideScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(index)
    }
}
