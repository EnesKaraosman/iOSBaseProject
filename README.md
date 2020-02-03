# iOSBaseProject
You're gonna start to a new project and fed up doing same initialization every time.



# *TODO LIST*

## - Network

[Network.md](https://github.com/EnesKaraosman/iOSBaseProject/blob/master/BaseProject/Network/NetworkUsage.md) file exist in project's network module, for detail usage you can play with it.
#### Parsing

* SwiftyJSON ✅
* Codable ✅

#### Reactive
* Rx Extensions (versions) ✅
* Moya: Consider using enumeration cases for api (service interfaces) ref: ios-base-swift-master/Services ❌

#### Tracking network activities
*  External app: Bagel ✅
*  Internal pod: AlamofireNetworkActivityLogger ✅

#### Settings.bundle custom settings
* Add support for switching Environment from iOS > Settings > App > Environments ✅

------

## - Clean Architecture

#### Design Pattern
* MVVM ✅
* MVP
* VIPER

#### Coordinator
* XCoordinator for presenting ViewController (consider bottom popup to reflect iOS 13's default behaviour)

#### Dependency Injection
* Resolver: https://github.com/hmlongco/Resolver

------

## - Database
* UserDefaults (propertyWrapper) ✅
* CoreData 
* Realm    

------

## - Helper, Util
* Logger (May be used with analitycs services) ✅
* Localization ✅ (Consider using SwiftGen, autogenerated localization strings https://github.com/SwiftGen/SwiftGen)
* Styler (TextStyle, FontManager)
* Reusable (Identifiable)
* Loading Indicator integration ✅
* Extensions
* Bottom bar vc, PagerStripVC
* Constants
* Configuration File (May include all primary fonts, colors, urls.. ?) ✅
* Permissions (https://github.com/ivanvorobei/SPPermissions)
* SwiftLint
* ThemeManager
* Plist manager
* BaseClasses, BaseComponents (BaseViews, Dark mode support)
* Component Factory (UI components)

------

## - Analytics
* Crahslytics
* Fabric

------
