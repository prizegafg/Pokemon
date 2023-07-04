//
//  CatchPokemonVC.swift
//  PokemonApp
//
//  Created by Prizega  on 19/05/23.
//

import UIKit
import MapKit
import CoreLocation
import Kingfisher

class CatchPokemonVC: UIViewController {

    // Setup Main View
    
    @IBOutlet weak var vwNavigation: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwDiscover: UIView!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var mapLocation: MKMapView!
    @IBOutlet weak var btnDiscover: UIButton!
    @IBOutlet weak var vwCatch: UIView!
    
    //Setup Catch Pokemon
    
    @IBOutlet weak var scrollCatch: UIScrollView!
    @IBOutlet weak var vwButtonCatch: UIView!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblPokemonName: UILabel!
    @IBOutlet weak var vwType: UIView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var vwAbility: UIView!
    @IBOutlet weak var lblAbility: UILabel!
    @IBOutlet weak var lblStats: UILabel!
    @IBOutlet weak var tableStats: UITableView!
    @IBOutlet weak var btnCatch: UIButton!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    var presenter: VTPCatchPokemonProtocol?
    var cond = 1
    let url = "https://pokeapi.co/api/v2/pokemon/"
    var pokeData: [PokemonCatchModel] = []
    let key = "Catch Pokemon"
    var randPokemon: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.setHidesBackButton(true, animated: false)
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        self.navigationItem.hidesBackButton = true
        lblTitle.text = "Discover Your Pokemon"
        self.vwCatch.isHidden = true
        lblSubTitle.text = "Your Current Location :"
        btnDiscover.setTitle("Search Pokemon", for: .normal)
        lblStats.text = "Stats"
        btnCatch.setTitle("Catch Pokemon", for: .normal)
        btnCatch.backgroundColor = .greenCustom
        btnCatch.layer.cornerRadius = 10
        vwType.layer.cornerRadius = 20
        vwAbility.layer.cornerRadius = 20
        
        
        tableStats.delegate = self
        tableStats.dataSource = self
        tableStats.allowsSelection = false
        tableStats.isScrollEnabled = false
        tableStats.register(CatchPokemonTVC.nib(), forCellReuseIdentifier: CatchPokemonTVC.identifier)
        tableStats.rowHeight = UITableView.automaticDimension
    }
    
    func setUpAction(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapLocation.delegate = self
        mapLocation.showsUserLocation = true
        btnBack.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        btnDiscover.addTarget(self, action: #selector(discoverPokemon), for: .touchUpInside)
        btnCatch.addTarget(self, action: #selector(catchPokemon), for: .touchUpInside)
    }
    
    func showPokemon(){
        let pokemon = pokeData.first
        
        if let img = pokeData.first?.image {
            let url = URL(string: "\(img)")
            imgPokemon.kf.setImage(with: url )
        }
        
        lblPokemonName.text = pokemon?.name?.capitalized
        lblType.text = pokemon?.type.first?.name?.capitalized
        lblAbility.text = pokemon?.ability.first?.name?.capitalized
        
        if lblType.text == "Grass"  {
            vwType.backgroundColor = .greenCustom
            vwAbility.backgroundColor = .greenCustom
        } else {
            vwType.backgroundColor = .green
            vwAbility.backgroundColor = .green
        }
        
        tableStats.reloadData()
        
        lblTitle.text = "Catch Pokemon"
        scrollCatch.isHidden = false
        vwButtonCatch.isHidden = false
        loadingActivity.isHidden = true
        loadingActivity.stopAnimating()
        
    }
    
    func clearData(){
        imgPokemon.image = UIImage(named: "")
        lblPokemonName.text = ""
        lblAbility.text = ""
        lblType.text = ""
        pokeData.removeAll()
        tableStats.reloadData()
    }
    
    @objc func discoverPokemon(){
        lblTitle.text = "Loading"
        vwDiscover.isHidden = true
        vwCatch.isHidden = false
        scrollCatch.isHidden = true
        vwButtonCatch.isHidden = true
        loadingActivity.isHidden = false
        loadingActivity.startAnimating()
        cond = 2
        presenter?.fetchGetPokemon(url: url)
        
    }
    
    @objc func backButtonPressed(){
        switch cond {
        case 1 :
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
                
            }
        case 2 :
            cond = 1
            lblTitle.text = "Discover Your Pokemon"
            vwDiscover.isHidden = false
            vwCatch.isHidden = true
            clearData()
            
        default :
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
                
            }
        }
    }
    
    @objc func catchPokemon(){
//        Alert.showGeneralAlert(title: "Success Catch Pokemon", message: "Success catch new pokemon, please give name to your new Pokemon", viewController: self)
        if let navigation = navigationController {
            presenter?.goToAttackPokemon(img: (pokeData.first?.image)!, nav: navigation)
        }
    }
    
    


}

extension CatchPokemonVC: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let regionRadius: CLLocationDistance = 100 // The desired radius around the user's location in meters
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapLocation.setRegion(region, animated: true)
            
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let placemark = placemarks?.first {
                    let streetName = placemark.thoroughfare ?? ""
                    DispatchQueue.main.async {
                    self.lblLocation.text = "\(streetName)"
                    }
                }
            }
        }
        
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}

extension CatchPokemonVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeData.first?.stat.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CatchPokemonTVC.identifier, for: indexPath) as! CatchPokemonTVC
        
        cell.setUpCell(title: pokeData.first?.stat[row].name ?? "Stats", stats: pokeData.first?.stat[row].baseStat ?? 0)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}



extension CatchPokemonVC: PTVCatchPokemonProtocol {
   func successGetPokemon(data: [PokemonCatchModel]) {
       self.pokeData = data
       let range = data.count
       print(data.count)
       var randNumber = Int(arc4random_uniform(UInt32(range)))
       
       showPokemon()
    }
    
    func failedGetPokemon(error: String) {
        Alert.showGeneralAlert(title: "Error", message: error, viewController: self)
    }
    
    
    
    
}
