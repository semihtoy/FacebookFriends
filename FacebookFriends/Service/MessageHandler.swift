//
//  MessageHandler.swift
//  FacebookFriends
//
//  Created by Xcode on 1.03.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//
import Foundation
import UIKit
class Loading {
    var alert = UIAlertController(title: nil, message: "Loading", preferredStyle: .alert)
    func show() -> Void {
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    func hide() -> Void {
        alert.dismiss(animated: true)
    }
}



