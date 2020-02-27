//
//  UserDetailViewController.swift
//  FacebookFriends
//
//  Created by Xcode on 27.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
import MapKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var UserPicture: UIView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserCompany: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    @IBOutlet weak var UserPhone: UILabel!
    @IBOutlet weak var UserAbout: UITextView!
    @IBOutlet weak var FavoriteFriendCV: UICollectionView!
    @IBOutlet weak var HomeLocation: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeLocation.delegate = (self as! MKMapViewDelegate)
        // Do any additional setup after loading the view.
    }

}
