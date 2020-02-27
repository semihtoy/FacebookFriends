//
//  GetUser.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
class User:ServiceBase {
    func get( result: @escaping ([UserDetail]) -> Void ) -> Void {
        let preferences = UserDefaults.standard
       let userName = preferences.string(forKey: "userName")
        
        http.get(url:createUrl(userName: userName!)){ (data) in
        let jsonDecoder = JSONDecoder()
            do {
                let responseModel = try jsonDecoder.decode([UserDetail].self, from: data)
                result(responseModel)
            } catch {
            }
            }
        }
    }
