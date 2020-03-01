//
//  UserViewController.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//
import UIKit
import Kingfisher
import Alamofire
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
        let imageURL = URL(string: user[indexPath.row].picture)
        cell.ProfilPicture.kf.setImage(with: imageURL)
        if user[indexPath.row].isActive == false {
            cell.ProfilPicture.layer.borderWidth = 4
            cell.ProfilPicture.layer.borderColor = UIColor(red:178/255, green:255/255, blue:89/255, alpha: 1).cgColor
        } else {
            cell.ProfilPicture.layer.borderWidth = 4
            cell.ProfilPicture.layer.borderColor = UIColor(red:219/255, green:68/255, blue:55/255, alpha: 1).cgColor
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = user[indexPath.row];
        self.performSegue(withIdentifier: "UserDetailSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailSegue" {
            let destinationVC = segue.destination as! UserDetailViewController
            destinationVC.selectedUser = selectedUser
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NetworkReachabilityManager()!.isReachable)
        if(NetworkReachabilityManager()!.isReachable)
        {
            _user.get { (UserDetail) in
                self.user = UserDetail
                self.FriendUserTV.reloadData()
                RealmHelper.sharedInstance.deleteAllFromDatabase()
                for user in UserDetail {
                    RealmHelper.sharedInstance.addData(object: user)
                }
            }
        } else {
            print("get data fropm realm")
            self.user =  RealmHelper.sharedInstance.getDataFromDB().map { $0 }
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
