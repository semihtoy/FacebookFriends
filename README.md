# FacebookFriends
# Introduction

This is a project  to create MVC patern.Layered architecture is used in this project.

#### HTTP Layer(Data layer):
This  layer used only for  http request.Authentication is added in this layer. (Post,Get,Delete,Update)
#### Services Layer(Business layer):
It is the layer that uses the methods provided by the data layer by processing or controlling the information coming from the presentation layer according to the required conditions.
#### Controller Layer(Presentation Layer):
The layer that interacts directly with the user.
 

# Screenshots

#### Login Screen
![](_screenshots/Login.jpeg)
#### Loading Screen
![](_screenshots/Loading.jpeg)
#### Profile Screen
![](_screeenshots/UserProfile.jpeg)
#### User Detail Screen
![](_screenshots/UserDetail.jpeg)
![](_screenshots/UserDetail1.jpeg)





## Installation

### CocoaPods
 Open  CocoaPods file and  install pods

#Library
1. [Alomofire](https://github.com/Alamofire/Alamofire) (For Network).
2. [KingFisher](https://github.com/onevcat/Kingfisher) (Image download and caching).
3. [RealmSwift](https://realm.io/docs/swift/latest/) (For Local Database).
