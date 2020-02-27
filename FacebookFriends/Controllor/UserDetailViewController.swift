//
//  UserDetailViewController.swift
//  FacebookFriends
//
//  Created by Xcode on 27.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher
import CoreLocation
class UserDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,CLLocationManagerDelegate, MKMapViewDelegate {

    var selectedUser : UserDetail?
    let locationManager = CLLocationManager()

    @IBOutlet weak var UserPicture: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserCompany: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    @IBOutlet weak var UserPhone: UILabel!
    @IBOutlet weak var UserAbout: UITextView!
    @IBOutlet weak var FavoriteFriendCV: UICollectionView!
    @IBOutlet weak var HomeLocation: MKMapView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (selectedUser?.favorite_friends!.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as?
            FriendCollectionViewCell else { return UICollectionViewCell() }
        cell.FriendName.text = selectedUser?.favorite_friends![indexPath.row].name
        return cell
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
        locValue.latitude = (selectedUser?.home?.latitude)!
        locValue.longitude = (selectedUser?.home?.longitude)!

        HomeLocation.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        HomeLocation.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = selectedUser?.name
        annotation.subtitle = "current location"
        HomeLocation.addAnnotation(annotation)

        //centerMap(locValue)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UserName.text = selectedUser?.name
        UserCompany.text = selectedUser?.company
        UserEmail.text = selectedUser?.email
        UserPhone.text = selectedUser?.phone
        UserAbout.text = selectedUser?.about
        UserPicture.layer.borderWidth = 2
        UserPicture.layer.borderColor = UIColor(red:80/255, green:155/255, blue:243/255, alpha: 1).cgColor
        let imageURL = URL(string: (selectedUser?.picture!)!)
        UserPicture.kf.setImage(with: imageURL)
        FavoriteFriendCV.dataSource = self
        FavoriteFriendCV.delegate = self
        self.FavoriteFriendCV.reloadData()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        HomeLocation.delegate = self
        HomeLocation.mapType = .standard
        HomeLocation.isZoomEnabled = true
        HomeLocation.isScrollEnabled = true
        if let coor = HomeLocation.userLocation.location?.coordinate{
            HomeLocation.setCenter(coor, animated: true)
        }
        
    }

}
