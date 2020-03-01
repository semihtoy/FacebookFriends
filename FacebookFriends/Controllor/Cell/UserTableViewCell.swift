//
//  UserTableViewCell.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var ProfilPicture: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserCompany: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
