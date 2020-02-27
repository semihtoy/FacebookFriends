//
//  ServiceBase.swift
//  FacebookFriends
//
//  Created by Xcode on 26.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import Foundation

protocol  ServiceBaseProtocol {
     var http:HTTP { get set };
     func createUrl()-> String
}

class ServiceBase:ServiceBaseProtocol{
    var http = HTTP()
    
     func createUrl()-> String {
        let UrlBase:String = "https://api.myjson.com/bins/\(userName ?? "")"
        return UrlBase;
    }
}
