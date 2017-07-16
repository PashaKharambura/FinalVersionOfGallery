import UIKit
import SDWebImage
import MapKit

class ExhibitionsDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var fullNameGallery: UILabel!
    @IBOutlet weak var galleryName: UILabel!
    
    @IBOutlet weak var showStackView: UIButton!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var scheduleLabel2: UILabel!
    
    @IBOutlet weak var galleryAdress: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var webAdress: UILabel!
    @IBOutlet weak var facebook: UILabel!

    @IBOutlet weak var texhAboutGallery: UITextView!

    @IBOutlet weak var textAboutExhibition: UITextView!
    @IBOutlet weak var textAboutArtists: UITextView!
    @IBOutlet weak var links: UITextView!
 
    @IBOutlet weak var likeButton: UIBarButtonItem!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var mainStackView: UIStackView!
    public var exhibitionData: ExibitionVO!
    
    var likePressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        mainStackView.subviews[2].isHidden = true
        
        print("Long: \(exhibitionData.gallery?.longitude ?? "gavno")")
        print("Lat: \(exhibitionData.gallery?.latitude ?? "gavno")")
        
        var  initialLocation = CLLocation(latitude: 0.0, longitude: 0.0)
        
        if let galleryLongitude = (exhibitionData.gallery?.longitude)?.doubleValue {
            if let galleryLatitude = (exhibitionData.gallery?.latitude)?.doubleValue {
                initialLocation = CLLocation(latitude: galleryLatitude, longitude: galleryLongitude)
            }
        }
        centerMapOnLocation(location: initialLocation)
        
        titleLabel.text = exhibitionData.gallery?.name
        authorLabel.text = exhibitionData.authourName
        datesLabel.text = String(describing: Date.from(string: exhibitionData.startDate?.iso)!).components(separatedBy: " ").first! + " - " + String(describing: Date.from(string: exhibitionData.endDate?.iso)!).components(separatedBy: " ").first!
        galleryName.text = exhibitionData.gallery?.name
        scheduleLabel.text = exhibitionData.gallery?.schedule?[0]
        scheduleLabel2.text = exhibitionData.gallery?.schedule?[1]
        galleryAdress.text = exhibitionData.gallery?.address
        phone.text = exhibitionData.gallery?.phone
        webAdress.text = exhibitionData.gallery?.link
        facebook.text = exhibitionData.gallery?.facebook
        texhAboutGallery.text = exhibitionData.gallery?.galleryDescript
        textAboutExhibition.text = exhibitionData.details
        textAboutArtists.text = exhibitionData.authourDeskript
        links.text = exhibitionData.gallery?.link
        
        
    }
    
    let regionRadius: CLLocationDistance = 500
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: false)
    }
    
    @IBAction func likeAction(_ sender: UIBarButtonItem) {
        if likePressed == false {
            likeButton.image = UIImage(named: "like_full")
            likePressed = true
        } else if likePressed == true {
            likeButton.image = UIImage(named: "like")
            likePressed = false
        }
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func showDetails(_ sender: UIButton) {
        if  mainStackView.subviews[2].isHidden == true {
            mainStackView.subviews[2].isHidden = false
            sender.transform = sender.transform.rotated(by: CGFloat(Double.pi))
        } else {
            mainStackView.subviews[2].isHidden = true
            sender.transform = sender.transform.rotated(by: CGFloat(Double.pi))
        }
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return (exhibitionData.works?.count)!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MuCollectionViewCell
        cell.imageInCollectionView.image = UIImage(named: "notAviable")
        return cell
    }
    
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let cell = sender as! UITableViewCell
    //        let index = tableView.indexPath(for: cell)!
    //        let exhibition = ExhibitionsModel.instance.exhibitions[index.row]
    //        let destination = segue.destination as! ExhibitionsDetailsViewController
    //        destination.exhibitionData = exhibition
    //    }
    //
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let index = myCollectionView.indexPath(for: cell)!.row
        let work = exhibitionData.works?[index]
        let destination = segue.destination as! WorkDetailsViewController
        destination.work = work!
    }
}
