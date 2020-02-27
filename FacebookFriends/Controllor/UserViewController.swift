//
//  UserViewController.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
import Kingfisher
class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var _user = User()
    var user = [UserDetail]()
    var selectedUser : UserDetail?
    @IBOutlet weak var FriendUserTV: UITableView!


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTVC") as?
                   UserTableViewCell else { return UITableViewCell() }
        cell.UserName.text = user[indexPath.row].name
        cell.UserCompany.text = user[indexPath.row].company
        cell.ProfilPicture.layer.borderWidth = 2
        cell.ProfilPicture.layer.borderColor = UIColor(red:80/255, green:155/255, blue:243/255, alpha: 1).cgColor
        let imageURL = URL(string: user[indexPath.row].picture!)
        cell.ProfilPicture.kf.setImage(with: imageURL);
        if user[indexPath.row].isActive == false {
            cell.isActive.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                selectedFilm = user[indexPath.row];
        self.performSegue(withIdentifier: "ToDetailsFilmSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailsFilmSegue" {
            let destinationVC = segue.destination as! DetailFilmController
            destinationVC.selectedFilm = selectedFilm
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _user.get { (UserDetail) in
            self.user = UserDetail
            self.FriendUserTV.reloadData()
        }
        FriendUserTV.dataSource = self
        FriendUserTV.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
