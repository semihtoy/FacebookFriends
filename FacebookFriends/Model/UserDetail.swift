import Foundation
import RealmSwift
class UserDetail:Object, Codable {
    override class func primaryKey() -> String? {
        return "id"
    }
    required init() {
    }

   @objc dynamic var id : String?
   @objc dynamic var isActive : Bool = true
   @objc dynamic var picture : String = ""
   @objc dynamic var age : Int = 0
   @objc dynamic var eyeColor : String?
   @objc dynamic var name : String?
   @objc dynamic var gender : String?
   @objc dynamic var company : String?
   @objc dynamic var email : String?
   @objc dynamic var phone : String?
   @objc dynamic var address : String?
   @objc dynamic var about : String?
   @objc dynamic var registered : String?
         dynamic var home : Home? 
         dynamic var favorite_friends : [FavoriteFriends]?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isActive = "isActive"
        case picture = "picture"
        case age = "age"
        case eyeColor = "eyeColor"
        case name = "name"
        case gender = "gender"
        case company = "company"
        case email = "email"
        case phone = "phone"
        case address = "address"
        case about = "about"
        case registered = "registered"
        case home = "home"
        case favorite_friends = "favorite_friends"
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)!
        picture = try values.decodeIfPresent(String.self, forKey: .picture)!
        age = try values.decodeIfPresent(Int.self, forKey: .age)!
        eyeColor = try values.decodeIfPresent(String.self, forKey: .eyeColor)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        about = try values.decodeIfPresent(String.self, forKey: .about)
        registered = try values.decodeIfPresent(String.self, forKey: .registered)
        home = try values.decodeIfPresent(Home.self, forKey: .home)!
        favorite_friends = try values.decodeIfPresent([FavoriteFriends].self, forKey: .favorite_friends)!
    }
}
