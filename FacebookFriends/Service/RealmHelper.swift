//
//  RealmHelper.swift
//  FacebookFriends
//
//  Created by Xcode on 29.02.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import Foundation
import RealmSwift
class RealmHelper {
    private var   database:Realm
    static let   sharedInstance = RealmHelper()
    private init() {
        database = try! Realm()
    }
    func getDataFromDB(filter:String) ->   Results<UserDetail> {
        let results: Results<UserDetail> =   database.objects(UserDetail.self).filter(filter);
        return results
    }
    func addData(object: UserDetail)   {
        try! database.write {
            database.add([object])
        }
    }
    func getDataFromDB() ->   Results<UserDetail> {
        let object: Results<UserDetail> = database.objects(UserDetail.self)
        return object;
    }
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    func deleteFromDb(object: UserDetail)   {
        try!   database.write {
            database.delete(object)
        }
    }
}


