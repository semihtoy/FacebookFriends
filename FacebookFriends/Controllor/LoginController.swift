//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
var userName : String?
class LoginController: UIViewController {
    var _user = User()
    var user = [UserDetail]()
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!

    
    @IBAction func SigninButton(_ sender: Any) {
        userName = UserNameTextField.text!
        _user.get { (UserDetail) in
            self.user = UserDetail
            self.performSegue(withIdentifier: "userSegue", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
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

