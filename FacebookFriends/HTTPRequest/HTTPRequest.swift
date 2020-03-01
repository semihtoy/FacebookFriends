//
//  HTTPRequest.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import Alamofire
class HTTP  {
    func get(url:String, result: @escaping (Data) -> Void    ) -> Void {
        AF.request(url, method: .get).response { response in
        result(response.data!)
        }
    }
    func post() -> Void {
    }
    func put() -> Void {
    }
    func delete() -> Void {
    }
}
